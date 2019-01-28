@isTest
public class ActionItemsFullViewControllerTest {
 static testMethod void ActionItemsFullViewControllerTest() {
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
     	
     	String bulkchar='';
        for(Integer p=0;p<300;p++){
        	bulkchar=bulkchar+'1';             
        }
     
        List<Task> tasks= new List<Task>();
        for(Integer i=0;i<6;i++){
            Task ta=new Task();
            ta.WhatId=qb.id;
            ta.Task_Type__c='Action Item';
            ta.Status='Open';
            ta.Priority='Middle';
            ta.Subject='abc';
            ta.Description=bulkchar;
            tasks.add(ta);
        }
		insert tasks;
 		ActionItemsFullViewController.getItems(qb.id);
		ActionItemsFullViewController.removeRecord(tasks[0].id);   
        ActionItemsFullViewController.doSort(qb.id,'ActivityDate','arrowup');
     	ActionItemsFullViewController.doSort(qb.id,'ActivityDate','');
     	ActionItemsFullViewController.doSort(qb.id,'Subject','');
        ActionItemsFullViewController.doSort(qb.id,'Subject','arrowup');
        Test.stopTest();
    }
}