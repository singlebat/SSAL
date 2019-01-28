@isTest(SeeAllData=false)
private class MSGA_M_One_ProductTriggerHandlerTest 
{
	@testSetup static void setUp()
    {
        Test.setMock(WebServiceMock.class, new MetadataServiceTest.WebServiceMockImpl());
        Test.startTest();
        MSGA_M_One_Product__c customProduct = new MSGA_M_One_Product__c();
        customProduct.GLOBAL_ITEM_NAME__c = 'TEST_THGBMHG8C4LBAIRA4H_1';
        customProduct.Item_Status__c = 'Active';
        customProduct.BU__c = 'X66';
        customProduct.CELL__c = 'eD2';
        customProduct.DR__c = '15n';
        customProduct.PKG__c = 'BGA';
        customProduct.Design__c = '-';
        customProduct.Product_Type__c = 'eMMC';
        // BU/Product Type/DR/Cell/PKG/Design/DWPD/User Capacity
        //customProduct.Item_Name__c = customProduct.BU__c + '/' + customProduct.Product_Type__c + '/' + customProduct.DR__c + '/' + customProduct.CELL__c + '/' + customProduct.PKG__c + '/' + customProduct.Design__c + '/' + customProduct.DWPD__c + '/' + customProduct.User_Capacity__c;        
        insert customProduct;
        Test.stopTest();
    }
    private MSGA_M_One_Product__c createProduct()
    {
    	MSGA_M_One_Product__c customProduct = new MSGA_M_One_Product__c();
        customProduct.GLOBAL_ITEM_NAME__c = 'TEST_THGBMHG8C4LBAIRA4H';
        customProduct.Item_Status__c = 'Active';
        customProduct.BU__c = 'X66';
        customProduct.CELL__c = 'eD2';
        customProduct.DR__c = '15n';
        customProduct.PKG__c = 'BGA';
        customProduct.Design__c = '-';
        customProduct.Product_Type__c = 'eMMC';
        return customProduct;
    }
    @isTest static void testMSGA_M_One_ProductInsertAndUpdate_Active()
    {
        Test.setMock(WebServiceMock.class, new MetadataServiceTest.WebServiceMockImpl());
        Test.startTest();
        MSGA_M_One_Product__c customProduct = new MSGA_M_One_Product__c();
        customProduct.Name = 'TEST_THGBMHG8C4LBAIRA4H';
        customProduct.Item_Status__c = 'Active';
        customProduct.BU__c = 'X66';
        customProduct.CELL__c = 'eD2';
        customProduct.DR__c = '15n';
        customProduct.PKG__c = 'BGA';
        customProduct.Design__c = '-';
        customProduct.Product_Type__c = 'eMMC';
        // BU/Product Type/DR/Cell/PKG/Design/DWPD/User Capacity
        //customProduct.Item_Name__c = customProduct.BU__c + '/' + customProduct.Product_Type__c + '/' + customProduct.DR__c + '/' + customProduct.CELL__c + '/' + customProduct.PKG__c + '/' + customProduct.Design__c + '/' + customProduct.DWPD__c + '/' + customProduct.User_Capacity__c;        
        insert customProduct;
        Test.stopTest();
        system.assertEquals(1, [select Id from Product2].size());
        system.assertEquals(1, [select Id from PricebookEntry].size());
    }
    @isTest static void testMSGA_M_One_ProductInsertAndUpdate_Active_Npp()
    {
        Test.setMock(WebServiceMock.class, new MetadataServiceTest.WebServiceMockImpl());
        Test.startTest();
        MSGA_M_One_Product__c customProduct = new MSGA_M_One_Product__c();
        customProduct.Name = 'TEST_THGBMHG8C4LBAIRA4H';
        customProduct.Item_Status__c = 'Active-Npp';
        customProduct.BU__c = 'X66';
        customProduct.CELL__c = 'eD2';
        customProduct.DR__c = '15n';
        customProduct.PKG__c = 'BGA';
        customProduct.Design__c = '-';
        customProduct.Product_Type__c = 'eMMC';
        // BU/Product Type/DR/Cell/PKG/Design/DWPD/User Capacity
        //customProduct.Item_Name__c = customProduct.BU__c + '/' + customProduct.Product_Type__c + '/' + customProduct.DR__c + '/' + customProduct.CELL__c + '/' + customProduct.PKG__c + '/' + customProduct.Design__c + '/' + customProduct.DWPD__c + '/' + customProduct.User_Capacity__c;        
        insert customProduct;
        Test.stopTest();
        system.assertEquals(1, [select Id from Product2].size());
        system.assertEquals(1, [select Id from PricebookEntry].size());
    }
    @isTest static void testMSGA_M_One_ProductInsertAndUpdate_DISCON()
    {
        Test.setMock(WebServiceMock.class, new MetadataServiceTest.WebServiceMockImpl());
        Test.startTest();
        MSGA_M_One_Product__c customProduct = new MSGA_M_One_Product__c();
        customProduct.Name = 'TEST_THGBMHG8C4LBAIRA4H';
        customProduct.Item_Status__c = 'DISCON';
        customProduct.BU__c = 'X66';
        customProduct.CELL__c = 'eD2';
        customProduct.DR__c = '15n';
        customProduct.PKG__c = 'BGA';
        customProduct.Design__c = '-';
        customProduct.Product_Type__c = 'eMMC';
        // BU/Product Type/DR/Cell/PKG/Design/DWPD/User Capacity
        //customProduct.Item_Name__c = customProduct.BU__c + '/' + customProduct.Product_Type__c + '/' + customProduct.DR__c + '/' + customProduct.CELL__c + '/' + customProduct.PKG__c + '/' + customProduct.Design__c + '/' + customProduct.DWPD__c + '/' + customProduct.User_Capacity__c;        
        insert customProduct;
        Test.stopTest();
        system.assertEquals(1, [select Id from Product2].size());
        system.assertEquals(1, [select Id from PricebookEntry].size());
    }
    
    @isTest static void testMSGA_M_One_ProductInsertAndUpdate_engineer()
    {
        Test.setMock(WebServiceMock.class, new MetadataServiceTest.WebServiceMockImpl());
        Test.startTest();
        MSGA_M_One_Product__c customProduct = new MSGA_M_One_Product__c();
        customProduct.Name = 'TEST_THGBMHG8C4LBAIRA4H';
        customProduct.Item_Status__c = 'engineer';
        customProduct.BU__c = 'X66';
        customProduct.CELL__c = 'eD2';
        customProduct.DR__c = '15n';
        customProduct.PKG__c = 'BGA';
        customProduct.Design__c = '-';
        customProduct.Product_Type__c = 'eMMC';
        // BU/Product Type/DR/Cell/PKG/Design/DWPD/User Capacity
        //customProduct.Item_Name__c = customProduct.BU__c + '/' + customProduct.Product_Type__c + '/' + customProduct.DR__c + '/' + customProduct.CELL__c + '/' + customProduct.PKG__c + '/' + customProduct.Design__c + '/' + customProduct.DWPD__c + '/' + customProduct.User_Capacity__c;        
        insert customProduct;
        Test.stopTest();
        system.assertEquals(1, [select Id from Product2].size());
        system.assertEquals(1, [select Id from PricebookEntry].size());
    }
    
    @isTest static void testMSGA_M_One_ProductInsertAndUpdate_Phase_Out()
    {
        Test.setMock(WebServiceMock.class, new MetadataServiceTest.WebServiceMockImpl());
        Test.startTest();
        MSGA_M_One_Product__c customProduct = new MSGA_M_One_Product__c();
        customProduct.Name = 'TEST_THGBMHG8C4LBAIRA4H';
        customProduct.Item_Status__c = 'Phase-Out';
        customProduct.BU__c = 'X66';
        customProduct.CELL__c = 'eD2';
        customProduct.DR__c = '15n';
        customProduct.PKG__c = 'BGA';
        customProduct.Design__c = '-';
        customProduct.Product_Type__c = 'eMMC';
        // BU/Product Type/DR/Cell/PKG/Design/DWPD/User Capacity
        //customProduct.Item_Name__c = customProduct.BU__c + '/' + customProduct.Product_Type__c + '/' + customProduct.DR__c + '/' + customProduct.CELL__c + '/' + customProduct.PKG__c + '/' + customProduct.Design__c + '/' + customProduct.DWPD__c + '/' + customProduct.User_Capacity__c;        
        insert customProduct;
        Test.stopTest();
        system.assertEquals(1, [select Id from Product2].size());
        system.assertEquals(1, [select Id from PricebookEntry].size());
    }
    
    @isTest static void testMSGA_M_One_ProductInsertAndUpdate_Pre_Active()
    {
        Test.setMock(WebServiceMock.class, new MetadataServiceTest.WebServiceMockImpl());
        Test.startTest();
        MSGA_M_One_Product__c customProduct = new MSGA_M_One_Product__c();
        customProduct.Name = 'TEST_THGBMHG8C4LBAIRA4H';
        customProduct.Item_Status__c = 'Pre-Active';
        customProduct.BU__c = 'X66';
        customProduct.CELL__c = 'eD2';
        customProduct.DR__c = '15n';
        customProduct.PKG__c = 'BGA';
        customProduct.Design__c = '-';
        customProduct.Product_Type__c = 'eMMC';
        // BU/Product Type/DR/Cell/PKG/Design/DWPD/User Capacity
        //customProduct.Item_Name__c = customProduct.BU__c + '/' + customProduct.Product_Type__c + '/' + customProduct.DR__c + '/' + customProduct.CELL__c + '/' + customProduct.PKG__c + '/' + customProduct.Design__c + '/' + customProduct.DWPD__c + '/' + customProduct.User_Capacity__c;        
        insert customProduct;
        Test.stopTest();
        system.assertEquals(1, [select Id from Product2].size());
        system.assertEquals(1, [select Id from PricebookEntry].size());
    }
    
    @isTest static void testMSGA_M_One_ProductInsertAndUpdate_No_Promotion()
    {
        Test.setMock(WebServiceMock.class, new MetadataServiceTest.WebServiceMockImpl());
        Test.startTest();
        MSGA_M_One_Product__c customProduct = new MSGA_M_One_Product__c();
        customProduct.Name = 'TEST_THGBMHG8C4LBAIRA4H';
        customProduct.Item_Status__c = 'No Promotion';
        customProduct.BU__c = 'X66';
        customProduct.CELL__c = 'eD2';
        customProduct.DR__c = '15n';
        customProduct.PKG__c = 'BGA';
        customProduct.Design__c = '-';
        customProduct.Product_Type__c = 'eMMC';
        // BU/Product Type/DR/Cell/PKG/Design/DWPD/User Capacity
        //customProduct.Item_Name__c = customProduct.BU__c + '/' + customProduct.Product_Type__c + '/' + customProduct.DR__c + '/' + customProduct.CELL__c + '/' + customProduct.PKG__c + '/' + customProduct.Design__c + '/' + customProduct.DWPD__c + '/' + customProduct.User_Capacity__c;        
        insert customProduct;
        Test.stopTest();
        system.assertEquals(1, [select Id from Product2].size());
        system.assertEquals(1, [select Id from PricebookEntry].size());
    }
    
    @isTest static void testAfterUpdate()
    {
        Test.setMock(WebServiceMock.class, new MetadataServiceTest.WebServiceMockImpl());
        MSGA_M_One_Product__c prod   = [select Id, BU__c, DWPD__c, User_Capacity__c from MSGA_M_One_Product__c where Name = 'TEST_THGBMHG8C4LBAIRA4H_1' limit 1];
        Test.startTest();
        prod.BU__c = 'X67';
        update prod;
        Test.stopTest();
        system.assertEquals(2, [select Id from Product2].size());
        system.assertEquals(2, [select Id from PricebookEntry].size());
    }
    
    @isTest static void testIntegerData()
    {
        Test.setMock(WebServiceMock.class, new MetadataServiceTest.WebServiceMockImpl());
        MSGA_M_One_Product__c prod   = [select Id, BU__c, DWPD__c, User_Capacity__c from MSGA_M_One_Product__c where Name = 'TEST_THGBMHG8C4LBAIRA4H_1' limit 1];
        Test.startTest();
        prod.BU__c = 'X67';
        prod.DWPD__c = 'dwpd';
        prod.User_Capacity__c = 'user capacity';
        update prod;
        Test.stopTest();
        //system.assertEquals(null, [select Id, BU__c, DWPD__c, User_Capacity__c from MSGA_M_One_Product__c where Name = 'TEST_THGBMHG8C4LBAIRA4H_1' limit 1].DWPD__c);
        //system.assertEquals(null, [select Id, BU__c, DWPD__c, User_Capacity__c from MSGA_M_One_Product__c where Name = 'TEST_THGBMHG8C4LBAIRA4H_1' limit 1].User_Capacity);
    }
    
    @isTest static void testDateOversized()
    {
        Test.setMock(WebServiceMock.class, new MetadataServiceTest.WebServiceMockImpl());
        MSGA_M_One_Product__c prod   = [select Id, BU__c, DWPD__c, User_Capacity__c from MSGA_M_One_Product__c where Name = 'TEST_THGBMHG8C4LBAIRA4H_1' limit 1];
        Test.startTest();
        prod.BU__c = 'X67';
        prod.DWPD__c = '999999';
        prod.User_Capacity__c = '19999999999';
        update prod;
        Test.stopTest();
        //system.assertEquals(null, [select Id, BU__c, DWPD__c, User_Capacity__c from MSGA_M_One_Product__c where Name = 'TEST_THGBMHG8C4LBAIRA4H_1' limit 1].DWPD__c);
        //system.assertEquals(null, [select Id, BU__c, DWPD__c, User_Capacity__c from MSGA_M_One_Product__c where Name = 'TEST_THGBMHG8C4LBAIRA4H_1' limit 1].User_Capacity);
    }
    
    @isTest static void testFieldTruncation()
    {
        /*MSGA_M_One_Product__c customProd = new MSGA_M_One_Product__c();
        Map<String, Integer> lengthMap = new Map<String, Integer>();
        lengthMap = CommonUtils.getLength('MSGA_M_One_Product__c');
        
        //SObject customProd = Id.valueOf('01I6C0000000hmJ').getSObjectType.newSObject();
        //record.put('emp_name__c', 'test');
        //
        Id objId = '01I6C0000000hmJ';
        SObject customProd = objId.getSObjectType().newSObject(objId);
        
        //String soql
        for(String field : lengthMap.keySet())
        {
            customProd.put(field, CommonUtils.generateRandomString(300));
        }
        //customProd.Name = 'test12345';
        system.debug('---custom prod:' + customProd);
        insert customProd;
        
       /* String strSql = ' SELECT ';
        strSql += CommonUtils.getCustomFieldNames(MSGA_M_One_Product__c.sObjectType, null);//ALL項目
        strSql += '   FROM MSGA_M_One_Product__c';
        strSql += '  WHERE Id = :customProd.Id LIMIT 1';
        MSGA_M_One_Product__c prod = Database.query(strSql);
        //MSGA_M_One_Product__c prod = 
        for(String field : lengthMap.keySet())
        {
            system.assertEquals(lengthMap.get(field), String.valueOf(prod.get(field)).length());
            //customProd.put(field, CommonUtils.generateRandomString(300));
        }*/
        
       
        //system.assertEquals(255, ([select Id, Block__c from MSGA_M_One_Product__c where Id = :customProduct.Id].Block__c).length());
        /*MSGA_M_One_Product__c customProduct = new MSGA_M_One_Product__c();
        customProduct.Name = 'THGBMHG8C4LBAIRA4H';
        customProduct.Item_Status__c = 'Active';
        customProduct.BU__c = 'X66';
        customProduct.CELL__c = 'eD2';
        customProduct.DR__c = '15n';
        customProduct.PKG__c = 'BGA';
        customProduct.Design__c = '-';
        customProduct.DWPD__c = '1234';
        customProduct.Product_Type__c = 'eMMC';
        // X66/eMMC/15n/eD2/BGA/-/1adhs/
        insert customProduct;
        
        MSGA_M_One_Product__c prod = [select Id, Product__c, DWPD__c from MSGA_M_One_Product__c where Id = :customProduct.Id];
        
        system.assertEquals(null, [select Id, DWPD__c, Name from Product2 where Id = :prod.Product__c].DWPD__c);
        system.assertEquals('X66/eMMC/15n/eD2/BGA/-/1234/', [select Id, DWPD__c, Name from Product2 where Id = :prod.Product__c].Name);*/
    	
        
    
    }
}