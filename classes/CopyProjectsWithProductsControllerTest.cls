@isTest(SeeAllData=false)
public class CopyProjectsWithProductsControllerTest {
	@isTest
    public static void getProjectInfoTest(){
        Account acc = new Account();
        acc.name = 'accTest';
        insert acc;        
        
        Opportunity opp = new Opportunity();
        opp.name = 'oppTest';
        opp.AccountId = acc.Id;
        opp.StageName = 'Draft';
        opp.Business_Unit__c = 'X1';
        opp.CloseDate = Date.today();
        opp.Price_Expired_Date__c = Date.today();
        opp.Price_Effective_Date__c = Date.today();
        insert opp;
        
        Test.startTest();
        Map<String, Object> rtnMap = new Map<String, Object>();
        rtnMap = CopyProjectsWithProductsController.getProjectInfo(opp.Id);
        Test.stopTest();
    }
}