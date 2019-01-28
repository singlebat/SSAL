({
    init: function (component, event, helper) {
        var action = component.get("c.getItems");
        action.setParams({"projectId": component.get("v.recordId")});
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") 
            {   
                var result = response.getReturnValue();
                component.set('v.items',result.task);
                component.set('v.Url', result.url);
                component.set('v.baseUrl', result.baseUrl);
                component.set('v.itemsSize', result.taskSize);
                
                console.log('--result:' + response.getReturnValue());
            } 
            else if (state === "ERROR") 
            {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
    },
    remove: function (component, event, helper) {
        var selectedMenuItemValue =  event.getSource().get("v.value");
        var action = component.get("c.removeRecord");
        action.setParams({"recordId": selectedMenuItemValue});
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var a = component.get('c.init');
                $A.enqueueAction(a);
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
        
    },
    edit: function (component, event, helper) {
        var selectedMenuItemValue =  event.getSource().get("v.value");
        var editRecordEvent = $A.get("e.force:editRecord");
        editRecordEvent.setParams({
            "recordId": selectedMenuItemValue
        });
        editRecordEvent.fire();
        $A.get("e.force:refreshView").fire();  
    },
    edit2: function (component, event, helper) {
        var selectedMenuItemValue =  event.getSource().get("v.value");
        $A.createComponent('force:recordEdit',
                           {        
                               'aura:id': 'edit',
                               'recordId': selectedMenuItemValue
                           },
                           function(edit, status, errorMessage){
                               if (status === "SUCCESS") {
                                   $A.get("e.force:refreshView").fire();                                   
                               }
                           }
                          );
        
    },
    toDetail: function (component, event, helper) {
   /*     var evt = $A.get("e.force:navigateToComponent");
        evt.setParams({
          componentDef: "c:ActionItemsListVIew",
          componentAttributes: { QBRid: "a006C000001m0OFQAY" }
        });
        evt.fire();*/
        alert("22334455");
        var editRecordEvent = $A.get("e.force:editRecord");
		editRecordEvent.setParams({
			"recordId": "00T6C000004997nUAA"
		});
        alert(selectedMenuItemValue);
		editRecordEvent.fire();
    }
})