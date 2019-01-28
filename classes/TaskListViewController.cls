public class TaskListViewController {
    @AuraEnabled
    public static String flag{get;set;}
    @AuraEnabled
    public static Integer taskSize{get;set;}
    @AuraEnabled
    public static String  Pid{get;set;}
    public  TaskListViewController() {
		Pid =ApexPages.currentPage().getParameters().get('id');
	}
    public  TaskListViewController(ApexPages.StandardController stdController) {
		//Pid =ApexPages.currentPage().getParameters().get('id');
		flag='false';
		QBR_QTR__c qbt=(QBR_QTR__c)stdController.getRecord();
        Pid=qbt.id;
        List<Task> temptask = [select Id, Subject, ActivityDate, Status, OwnerName__c,OwnerId,Priority 
                   		from Task 
                   		where WhatId = :Pid 
                   		and Task_Type__c='Action Item'
                    	order by ActivityDate desc nulls last,Priority desc
                  	];
        taskSize=temptask.size();
        
	}
}