public class CopyProjectsWithProductsController {
    /**
     * コンポーネント初期化
     */
    @AuraEnabled
    public static Map<String, Object> getProjectInfo(Id projectId) {
        //Projectデータ格納マップ
        Map<String, Object> oppMap = new Map<String, Object>();
        List<Opportunity> oppList = new List<Opportunity>();
        //コピー元Porjectを抽出するSOQL文
        String strSql = ' SELECT ';
        strSql += CommonUtils.getCustomFieldNames(Opportunity.sObjectType, null);//ALL項目
        strSql += '   FROM Opportunity';
        strSql += '  WHERE Id = :projectId LIMIT 1';
        oppList = Database.query(strSql);
        system.debug('#########projectId  '+projectId);
        system.debug('#########strSql  '+strSql);
        //コピー元Porjectが存在する場合
        if(oppList!=null && oppList.size()>0){
            Opportunity opp = oppList.get(0).clone();
            //フェーズ
            opp.StageName = 'Draft';
            //コピー元商品
            opp.Original_Project__c = projectId;
            //ProjectOwner
            opp.OwnerId = UserInfo.getUserId();
            //確度
            opp.probability = null;

            //商談オブジェクトの項目取得
			Map<string,Sobjectfield> fieldMap = Opportunity.sObjectType.getDescribe().fields.getmap();      
            for (String fieldName : fieldMap.keySet()) {
                //Projectデータ格納マップにコピー元Projectデータを設定する
                oppMap.put(CommonUtils.getFieldName(fieldMap, fieldName), opp.get(fieldName));
            }
        }
        return oppMap;
    }
}