({
    doAction : function(component,action,Stype) {
        var arrowDirectionSub = component.get("v.arrowDirectionSub");
        var arrowDirectionDate = component.get("v.arrowDirectionDate");
        var arrowDirectionS = component.get("v.arrowDirectionS");
        var arrowDirectionA = component.get("v.arrowDirectionA");
        var arrowDirectionP = component.get("v.arrowDirectionP");
        var arrowDirection="";
        //alert(arrowDirection);
        if(Stype=="Subject"){
            arrowDirection=arrowDirectionSub;
        }
        if(Stype=="Activitydate"){
            arrowDirection=arrowDirectionDate;
        }
        if(Stype=="Status"){
            arrowDirection=arrowDirectionS;
        }
        if(Stype=="OwnerId"){
            arrowDirection=arrowDirectionA;
        }
        if(Stype=="Priority"){
            arrowDirection=arrowDirectionP;
        }
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
                if(Stype=="Subject"){
                    if(arrowDirectionSub=="arrowdown"){
                        component.set("v.arrowDirectionSub","arrowup");
                    }else{
                        component.set("v.arrowDirectionSub","arrowdown");              
                    }
                }
                if(Stype=="Activitydate"){
                    if(arrowDirectionDate=="arrowdown"){
                        component.set("v.arrowDirectionDate","arrowup");
                    }else{
                        component.set("v.arrowDirectionDate","arrowdown");              
                    }
                }
                if(Stype=="Status"){
                    if(arrowDirectionS=="arrowdown"){
                        component.set("v.arrowDirectionS","arrowup");
                    }else{
                        component.set("v.arrowDirectionS","arrowdown");              
                    }
                }
                if(Stype=="OwnerId"){
                    if(arrowDirectionA=="arrowdown"){
                        component.set("v.arrowDirectionA","arrowup");
                    }else{
                        component.set("v.arrowDirectionA","arrowdown");              
                    }
                }
                if(Stype=="Priority"){
                    if(arrowDirectionP=="arrowdown"){
                        component.set("v.arrowDirectionP","arrowup");
                    }else{
                        component.set("v.arrowDirectionP","arrowdown");              
                    }
                }
                //alert(component.find("sob1"));
                //alert(component.find("sob2"));
                //$A.util.addClass(component.find("sob1"), 'toBlue');
                //$A.util.addClass(component.find("sob2"), 'toBlue');
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