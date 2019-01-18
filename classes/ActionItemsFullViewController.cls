public class ActionItemsFullViewController {
    @AuraEnabled
    public static Result getItems(Id projectId)
    {
        Result re=new Result();
        re.task=[select Id, Subject, ActivityDate, Status, OwnerName__c,OwnerId,Priority ,Description 
                 from Task 
                 where WhatId = :projectId 
                 and Task_Type__c='Action Item'
                 order by ActivityDate desc nulls last,Priority desc
                ];
        //覆盖抽取到的Sobject
        for(Task ta:re.task){
            system.debug(ta.Description);
            if(ta.Description!=null &&ta.Description.length()!=0){
                if(ta.Description.length()>255){
                    ta.Description=ta.Description.SubString(0,255);
                }
            }
        }
        //re.task =
        re.taskSize=re.task.size();
        return re;
    }
    @AuraEnabled
    public static Result doSort(Id projectId,String sortType,String Orderby)
    {
        if(Orderby=='arrowup'){
            Orderby='asc';
        }else{
            Orderby='desc';
        }
        String sql='select Id, Subject, ActivityDate, Status, OwnerName__c,OwnerId,Priority ,Description ';
        sql= sql+' from Task ';
        sql= sql+' where WhatId = \''+projectId +'\'';
        sql= sql+' and Task_Type__c=\'Action Item\'';
        sql= sql+' order by  '+sortType+' '+Orderby;
        
        Result re=new Result();
        system.debug(sql);
        re.task = Database.query(sql);	
        re.taskSize=re.task.size();
        return re;
    }
    @AuraEnabled
    public static void removeRecord(Id recordId)
    {
        List<Task> items = [select Id from Task Where id=:recordId];
        delete items;
    }
    public class Result
    {
        @AuraEnabled
        public List<Task> task;
        @AuraEnabled
        public Integer taskSize;
    }
}
