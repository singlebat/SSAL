({
    init: function (component, event, helper) {
        //alert("123333   "+component.get("v.QBRid"));
        var action = component.get("c.getItems");
        action.setParams({"projectId": component.get("v.QBRid")});
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") 
            {
                var result = response.getReturnValue();
                component.set('v.items',result.task);
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
    sortSubject: function (component, event, helper) {
        //alert(arrowDirection);
        var action = component.get("c.doSort");
        helper.doAction(component,action,"Subject");
    },
    sortActivitydate: function (component, event, helper) {
        //alert(arrowDirection);
        var action = component.get("c.doSort");
        helper.doAction(component,action,"Activitydate");
    },
    sortStatus: function (component, event, helper) {
        //alert(arrowDirection);
        var action = component.get("c.doSort");
        helper.doAction(component,action,"Status");
    },
    sortAssigned: function (component, event, helper) {
        //alert(arrowDirection);
        var action = component.get("c.doSort");
        helper.doAction(component,action,"OwnerId");
    },
    sortPriority: function (component, event, helper) {
        //alert(arrowDirection);
        var action = component.get("c.doSort");
        helper.doAction(component,action,"Priority");
    },
    sortComments: function (component, event, helper) {
        //alert(arrowDirection);
        var action = component.get("c.doSort");
        helper.doAction(component,action,"Description");
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
        //ここは、Lightning編集画面をVFページに表示するためのアクション
        //具体的な使い方はsforce.oneを参照してください
        sforce.one.editRecord(selectedMenuItemValue);
        //$A.get('e.force:editRecord').setParams({recordId:selectedMenuItemValue}).fire();
        //$A.get("e.force:refreshView").fire();
        //var editRecordEvent = $A.get("e.force:editRecord");
		//editRecordEvent.setParams({
		//	"recordId": selectedMenuItemValue
		//});
        //alert(selectedMenuItemValue);
		//editRecordEvent.fire();
    },
    MouseOverFunSob : function(component, event, helper){
		$A.util.removeClass(component.find("divHelpSob"), 'slds-hide');
    },
    MouseLeaveSob: function(component, event, helper){
		$A.util.addClass(component.find("divHelpSob"), 'slds-hide');
    },
     MouseOverFunDate : function(component, event, helper){
		$A.util.removeClass(component.find("divHelpDate"), 'slds-hide');
    },
    MouseLeaveDate: function(component, event, helper){
		$A.util.addClass(component.find("divHelpDate"), 'slds-hide');
    },
    MouseOverFunStatus : function(component, event, helper){
		$A.util.removeClass(component.find("divHelpStatus"), 'slds-hide');
    },
    MouseLeaveStatus: function(component, event, helper){
		$A.util.addClass(component.find("divHelpStatus"), 'slds-hide');
    },
     MouseOverFunAssigned : function(component, event, helper){
		$A.util.removeClass(component.find("divHelpAssigned"), 'slds-hide');
    },
    MouseLeaveAssigned: function(component, event, helper){
		$A.util.addClass(component.find("divHelpAssigned"), 'slds-hide');
    },
    MouseOverFunPriority : function(component, event, helper){
		$A.util.removeClass(component.find("divHelpPriority"), 'slds-hide');
    },
    MouseLeavePriority: function(component, event, helper){
		$A.util.addClass(component.find("divHelpPriority"), 'slds-hide');
    },
    MouseOverFunComments : function(component, event, helper){
		$A.util.removeClass(component.find("divHelpComments"), 'slds-hide');
    },
    MouseLeaveComments: function(component, event, helper){
		$A.util.addClass(component.find("divHelpComments"), 'slds-hide');
    },
})