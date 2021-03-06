public with sharing class ActionItemsController {
    @AuraEnabled
    public static Result getItems(Id projectId)
    {   
        List<Task> temptask= new List<Task>();
        Result re=new Result();
        temptask = [select Id, Subject, ActivityDate, Status, OwnerName__c,OwnerId,toLabel(Priority) 
                   		from Task 
                   		where WhatId = :projectId 
                   		and Task_Type__c='Action Item'
                    	order by ActivityDate desc nulls last,Priority desc
                  	];
        
        re.url=URL.getSalesforceBaseUrl().toExternalForm()+'/one/one.app#/alohaRedirect/apex/TaskListView?id='+projectId;
        re.taskSize=temptask.size();
        //結合テストで追加
        re.baseUrl=URL.getSalesforceBaseUrl().toExternalForm()+'/';

        if(re.taskSize>5){
            re.task= new List<Task>();
            for(Integer i=0;i<5;i++){
                re.task.add(temptask.get(i));
            }    
        }else{
            re.task=temptask;
        }
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
        public string url;
        //結合テストで追加
        @AuraEnabled
        public string baseUrl;
        @AuraEnabled
        public Integer taskSize;
    }
}