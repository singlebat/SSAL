({
	init: function (component, event, helper) {
        var action = component.get("c.getItems");
        action.setParams({"projectId": component.get("v.QBRid")});
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") 
            {   
                var result = response.getReturnValue();
            	component.set('v.items',result.task);
                component.set('v.Url', result.url);
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
    	},
    invoke : function(component, event, helper) {
        // Get the record ID attribute
        //var record = document.getElementById("rowLink").value;
		//alert(record);
        // Get the Lightning event that opens a record in a new tab
        //var navEvt = $A.get("e.force:navigateToSObject");
        //alert("111");
        // Pass the record ID to the event
        //navEvt.setParams({
         // "recordId": "a006C000001m0OFQAY"
       //});
       //alert("123");
        // Open the record
        //navEvt.fire();
        //var navEvt = $A.get("e.force:navigateToComponent");
        
        //alert("##"+sor);
        sforce.one.navigateToSObject(event.currentTarget.dataset.recordid);
    }
})