@isTest(SeeAllData=false)
public class CommonUtilsTest {
    /**
     * オブジェクトの全項目取得テストメソッド
     */
    @isTest
    public static void getCustomFieldNamesTest(){
        Test.startTest();
        String rtnStr;
        rtnStr = CommonUtils.getCustomFieldNames(Opportunity.sObjectType, null);
        rtnStr = CommonUtils.getCustomFieldNames(Opportunity.sObjectType, new Set<String>{'Amount'});
        Test.stopTest();
    }
    
    /**
     * API参照名取得テストメソッド
     */
    @isTest
    public static void getFieldNameTest(){
        Test.startTest();
        String rtnStr;
        //商談オブジェクトの項目取得
        Map<string,Sobjectfield> fieldMap = Opportunity.sObjectType.getDescribe().fields.getmap();      
        for (String fieldName : fieldMap.keySet()) {
            rtnStr = CommonUtils.getFieldName(fieldMap, fieldName);
        }
        Test.stopTest();
    }
    
    @isTest
    public static void getLabelTest(){
        Test.startTest();
        String rtnStr;
        rtnStr = CommonUtils.getLabel('Opportunity','Amount');
        Test.stopTest();
    }
    
    @isTest
    public static void getLengthTest(){
        Test.startTest();
        Map<String, Integer> rtnMap = new Map<String, Integer>();
        rtnMap = CommonUtils.getLength('Opportunity');
        Test.stopTest();
    }
    
    @isTest
    public static void generateRandomStringTest(){
        Test.startTest();
        String rtnStr;
		rtnStr = CommonUtils.generateRandomString(10);  
        Test.stopTest();
    }
    
    @isTest
    public static void updatePicklistTest(){
        List<String> SSDOptions = new List<String>{'123'};
        List<String> EncryptionOptions =  new List<String>{'123'};
        List<String> FormFactorOptions = new List<String>{'123'};
        List<String> fields = new List<String>{'SSD_I_F__c', 'SSD_Encryption__c','SSD_Form_Factor__c'};
        Test.setMock(WebServiceMock.class, new MetadataServiceTest.WebServiceMockImpl());
        Test.startTest();
        CommonUtils.updatePicklist('OpportunityLineItem', fields, SSDOptions, EncryptionOptions, FormFactorOptions );
        Test.stopTest();
    }
}