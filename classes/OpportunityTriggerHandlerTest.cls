@isTest
public class OpportunityTriggerHandlerTest {
	@isTest
    public static void copyProductsTest(){
        //取引先作成
        Account acc = new Account();
        acc.name = 'accTest';
        insert acc;        
      	//コピー元商談作成
        Opportunity opp = new Opportunity();
        opp.name = 'oppTest';
        opp.AccountId = acc.Id;
        opp.StageName = 'Draft';
        opp.Business_Unit__c = 'X1';
        opp.CloseDate = Date.today();
        opp.Price_Expired_Date__c = Date.today();
        opp.Price_Effective_Date__c = Date.today();
        opp.Pricebook2Id = Test.getStandardPricebookId();
        insert opp;
        //コピー先商談
        Opportunity oppCopy = opp.clone();
        oppCopy.Original_Project__c = opp.Id;
        insert oppCopy;
        
        //商品作成
        Product2 pdu = new Product2();
        pdu.name = 'pduTest';
        insert pdu;
        //PricebookEntry作成
        PricebookEntry priEntry = new PricebookEntry();
		priEntry.Pricebook2Id = Test.getStandardPricebookId();
        priEntry.Product2Id = pdu.Id;
        priEntry.UnitPrice = 2;
        priEntry.isActive=true;
        insert priEntry;
        //商談商品作成
        OpportunityLineItem oppItem = new OpportunityLineItem();
        oppItem.Product2Id = pdu.Id;
        oppItem.GB_Capacity__c = 1;
        oppItem.UnitPrice = 2;
        oppItem.TMC_Rep_Parts_No__c = '3';
        oppItem.OpportunityId = opp.Id;
        oppItem.PricebookEntryId = priEntry.Id;
        insert oppItem;
        
        Test.startTest();
        OpportunityTriggerHandler triHander = new OpportunityTriggerHandler();
        triHander.afterInsert(new List<Opportunity>{oppCopy});
        Test.stopTest();
    }
}