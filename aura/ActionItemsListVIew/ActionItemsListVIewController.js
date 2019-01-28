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
                component.set('v.QBRName',result.qbr.Name);
                component.set('v.itemsSize', result.taskSize);
                component.set('v.baseUrl',result.baseUrl);
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
        $A.util.addClass(component.find("divHelpDate"), 'slds-hide');
		$A.util.addClass(component.find("divHelpStatus"), 'slds-hide');
		$A.util.addClass(component.find("divHelpAssigned"), 'slds-hide');
		$A.util.addClass(component.find("divHelpPriority"), 'slds-hide');  
        //alert(component.find("sob1"));
    	$A.util.addClass(component.find("divHelpSob"), 'toBlue');
        $A.util.removeClass(component.find("divHelpDate"), 'toBlue');
		$A.util.removeClass(component.find("divHelpStatus"), 'toBlue');
		$A.util.removeClass(component.find("divHelpAssigned"), 'toBlue');
		$A.util.removeClass(component.find("divHelpPriority"), 'toBlue');
        component.set("v.flagAs","true");
        component.set("v.flagP","true");
        component.set("v.flagS","true");
        component.set("v.flagD","true");
        component.set("v.flagSob","false");
    },
    sortActivitydate: function (component, event, helper) {
        //alert(arrowDirection);
        var action = component.get("c.doSort");
        helper.doAction(component,action,"Activitydate");
        $A.util.addClass(component.find("divHelpSob"), 'slds-hide');
		$A.util.addClass(component.find("divHelpStatus"), 'slds-hide');
		$A.util.addClass(component.find("divHelpAssigned"), 'slds-hide');
		$A.util.addClass(component.find("divHelpPriority"), 'slds-hide');
        
        $A.util.removeClass(component.find("divHelpSob"), 'toBlue');
        $A.util.addClass(component.find("divHelpDate"), 'toBlue');
		$A.util.removeClass(component.find("divHelpStatus"), 'toBlue');
		$A.util.removeClass(component.find("divHelpAssigned"), 'toBlue');
		$A.util.removeClass(component.find("divHelpPriority"), 'toBlue');
        component.set("v.flagAs","true");
        component.set("v.flagP","true");
        component.set("v.flagS","true");
        component.set("v.flagD","false");
        component.set("v.flagSob","true");
    },
    sortStatus: function (component, event, helper) {
        //alert(arrowDirection);
        var action = component.get("c.doSort");
        helper.doAction(component,action,"Status");
         $A.util.addClass(component.find("divHelpSob"), 'slds-hide');
		$A.util.addClass(component.find("divHelpDate"), 'slds-hide');
		$A.util.addClass(component.find("divHelpAssigned"), 'slds-hide');
		$A.util.addClass(component.find("divHelpPriority"), 'slds-hide');
        
        $A.util.removeClass(component.find("divHelpSob"), 'toBlue');
        $A.util.removeClass(component.find("divHelpDate"), 'toBlue');
		$A.util.addClass(component.find("divHelpStatus"), 'toBlue');
		$A.util.removeClass(component.find("divHelpAssigned"), 'toBlue');
		$A.util.removeClass(component.find("divHelpPriority"), 'toBlue');
        component.set("v.flagAs","true");
        component.set("v.flagP","true");
        component.set("v.flagS","false");
        component.set("v.flagD","true");
        component.set("v.flagSob","true");
    },
    sortAssigned: function (component, event, helper) {
        //alert(arrowDirection);
        var action = component.get("c.doSort");
        helper.doAction(component,action,"OwnerId");
        $A.util.addClass(component.find("divHelpSob"), 'slds-hide');
		$A.util.addClass(component.find("divHelpDate"), 'slds-hide');
		$A.util.addClass(component.find("divHelpStatus"), 'slds-hide');
		$A.util.addClass(component.find("divHelpPriority"), 'slds-hide');
        
        $A.util.removeClass(component.find("divHelpSob"), 'toBlue');
        $A.util.removeClass(component.find("divHelpDate"), 'toBlue');
		$A.util.removeClass(component.find("divHelpStatus"), 'toBlue');
		$A.util.addClass(component.find("divHelpAssigned"), 'toBlue');
		$A.util.removeClass(component.find("divHelpPriority"), 'toBlue');
        component.set("v.flagAs","false");
        component.set("v.flagP","true");
        component.set("v.flagS","true");
        component.set("v.flagD","true");
        component.set("v.flagSob","true");
    },
    sortPriority: function (component, event, helper) {
        //alert(arrowDirection);
        var action = component.get("c.doSort");
        helper.doAction(component,action,"Priority");
        $A.util.addClass(component.find("divHelpSob"), 'slds-hide');
		$A.util.addClass(component.find("divHelpDate"), 'slds-hide');
		$A.util.addClass(component.find("divHelpStatus"), 'slds-hide');
		$A.util.addClass(component.find("divHelpAssigned"), 'slds-hide');
        
        $A.util.removeClass(component.find("divHelpSob"), 'toBlue');
        $A.util.removeClass(component.find("divHelpDate"), 'toBlue');
		$A.util.removeClass(component.find("divHelpStatus"), 'toBlue');
		$A.util.removeClass(component.find("divHelpAssigned"), 'toBlue');
		$A.util.addClass(component.find("divHelpPriority"), 'toBlue');
        component.set("v.flagP","false");
        component.set("v.flagAs","true");
        component.set("v.flagS","true");
        component.set("v.flagD","true");
        component.set("v.flagSob","true");
        
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
     MouseOverFunDate : function(component, event, helper){
		$A.util.removeClass(component.find("divHelpDate"), 'slds-hide');
       
    },
    MouseOverFunStatus : function(component, event, helper){
		$A.util.removeClass(component.find("divHelpStatus"), 'slds-hide');
       
    },

     MouseOverFunAssigned : function(component, event, helper){
		$A.util.removeClass(component.find("divHelpAssigned"), 'slds-hide');
        
    },
    MouseOverFunPriority : function(component, event, helper){
		$A.util.removeClass(component.find("divHelpPriority"), 'slds-hide');
        
    },
    MouseLeaveSob: function(component, event, helper){
        var flagP=component.get("v.flagSob");
        if(flagP=="true"){
			$A.util.addClass(component.find("divHelpSob"), 'slds-hide');
        }
    },
    MouseLeaveDate: function(component, event, helper){
        var flagP=component.get("v.flagD");
        if(flagP=="true"){
			$A.util.addClass(component.find("divHelpDate"), 'slds-hide');
        }
    },
    MouseLeaveStatus: function(component, event, helper){
        var flagP=component.get("v.flagS");
        if(flagP=="true"){
			$A.util.addClass(component.find("divHelpStatus"), 'slds-hide');
        }
    },
    MouseLeaveAssigned: function(component, event, helper){
        var flagP=component.get("v.flagAs");
        if(flagP=="true"){
			$A.util.addClass(component.find("divHelpAssigned"), 'slds-hide');
        }
    },
	MouseLeavePriority: function(component, event, helper){
        var flagP=component.get("v.flagP");
        if(flagP=="true"){
			$A.util.addClass(component.find("divHelpPriority"), 'slds-hide');
        }
    },
})