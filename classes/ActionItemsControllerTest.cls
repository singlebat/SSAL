@isTest
public class ActionItemsControllerTest {
    static testMethod void ActionItemsControllerTest() {
        Test.startTest();
  		
        Account ac=new Account();
        ac.Name='123';
        insert ac;
        
        QBR_QTR__c qb= new QBR_QTR__c();
        qb.Account__c=ac.id;
		qb.Name='123';
        qb.Meeting_Type__c='QBR';
        qb.Status__c='Draft';
        insert qb;
        
        List<Task> tasks= new List<Task>();
        for(Integer i=0;i<6;i++){
            Task ta=new Task();
            ta.WhatId=qb.id;
            ta.Task_Type__c='Action Item';
            ta.Status='Open';
            ta.Priority='Middle';
            ta.Subject='abc';
            tasks.add(ta);
        }
		insert tasks;
 		ActionItemsController.getItems(qb.id);
		ActionItemsController.removeRecord(tasks[0].id);   
        ActionItemsController.getItems(qb.id);
        
        Test.stopTest();
    }

}