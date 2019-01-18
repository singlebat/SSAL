({
    doAction : function(component,action,Stype) {
        var arrowDirection = component.get("v.arrowDirection");
        action.setParams({"projectId": component.get("v.QBRid"),
                         "sortType":Stype ,
                         "Orderby": arrowDirection});
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") 
            {   
                var result = response.getReturnValue();
                component.set('v.items',result.task);
                component.set('v.itemsSize', result.taskSize);
               
                if(arrowDirection=="arrowdown"){
                    component.set("v.arrowDirection","arrowup");
                }else{
                    component.set("v.arrowDirection","arrowdown");              
                }
                console.log('--result:' + response.getReturnValue());
            } 
            else if (state === "ERROR") 
            {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
    }
})