@isTest(SeeAllData=false)
private class VisibilityTest{
  @testSetup static void setup()
  {
      List<sObject> contracts = Test.loadData(Contract.sobjectType, 'testContracts');
      system.debug('--size:' + [select Id from Contract].size());
  }
  static testMethod void senario01() {
    for(User u:[Select Id,username From User Where username like '%@tmc.com']){
      system.runas(u){
        for(QBR_QTR__c q:[Select Id,Name From QBR_QTR__c order by name]){
          system.debug('username:'+u.username+' '+q.Name);
        }
      }
    }
  }

}