({
    doInit: function(component, event, helper) {
        //コンポーネントをと閉じる
        var closeAction = function() {
            var dismissActionPanel = $A.get("e.force:closeQuickAction");
            dismissActionPanel.fire();
        }
        setTimeout(closeAction, 0);
        
        //Project詳細画面からprojectIdを取得する
        var projectId = component.get("v.recordId");
        //コピー元Project情報を取得する
		var action = component.get("c.getProjectInfo");
        action.setParams({
            //ProjectIDを設定する
            "projectId": projectId
        });
        action.setCallback(this, function(res) {
            var state = res.getState();
            if (state == "SUCCESS") {
                var retObj = res.getReturnValue();
                //Projectコピー情報画面を呼び出す
                var createRecordEvent = $A.get("e.force:createRecord");
                createRecordEvent.setParams({
                    "entityApiName": "Opportunity",
                    "defaultFieldValues": retObj
                });
                createRecordEvent.fire();
            }
        });
        $A.enqueueAction(action);
    }
})