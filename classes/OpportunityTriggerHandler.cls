public class OpportunityTriggerHandler {
	/*
	 * 商談を新規作成した後
	 */
    public void afterInsert(List<Opportunity> newList){
		//「Clone With Products」機能により商談商品のコピー
		copyProducts(newList);
    }

	/*
     * 「Clone With Products」機能により商談商品のコピー
	 */
    private void copyProducts(List<Opportunity> newList){
        //ProductIdを取得する
        if(newList!=null && newList.size()==1){
            Opportunity opp = newList.get(0);
            //コピーされたProjectIdを設定する
            if(String.isNotBlank(opp.Original_Project__c)){
                Id oppId = opp.Original_Project__c;
                List<OpportunityLineItem> oppItemList = new List<OpportunityLineItem>();
                //コピー元商談商品を抽出するSOQL文
                String strSql = ' SELECT ';
                strSql += CommonUtils.getCustomFieldNames(OpportunityLineItem.sObjectType, null);//ALL項目
                strSql += '   FROM OpportunityLineItem';
                strSql += '  WHERE OpportunityId = :oppId';
                oppItemList = Database.query(strSql);
                system.debug('#########oppId  '+oppId);
                system.debug('#########sql  '+strSql);
                //商談商品が存在する場合
                if(oppItemList!=null && oppItemList.size()>0){
                    List<OpportunityLineItem> copyList = new List<OpportunityLineItem>();
                    for(OpportunityLineItem originalOppItem : oppItemList){
                        //商談商品をコピーする
                        OpportunityLineItem oppItem = originalOppItem.clone();
                        //TotlePriceを空白にする
                        oppItem.TotalPrice=null;
                        //コピー先のProject(商談)IDを設定する
                        oppItem.OpportunityId = opp.Id;
                        
                        copyList.add(oppItem);
                    }
                    //コピーされた商談商品を保存する
                    if(copyList!=null && copyList.size()>0){
                        insert copyList;
                    }
                }
            }
        }
    }
}