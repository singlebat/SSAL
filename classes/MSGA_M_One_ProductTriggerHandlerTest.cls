@isTest
private class MSGA_M_One_ProductTriggerHandlerTest 
{
	@testSetup static void setUp()
    {
        
    }
    @isTest static void testMSGA_M_One_ProductInsertAndUpdate()
    {
       /* MSGA_M_One_Product__c customProduct = new MSGA_M_One_Product__c();
        customProduct.Name = 'THGBMHG8C4LBAIRA4H';
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
        system.assertEquals(1, [select Id from Product2].size());
        system.assertEquals(1, [select Id from PricebookEntry].size());
        
        // Update 
        MSGA_M_One_Product__c customProduct2 = new MSGA_M_One_Product__c();
        customProduct2.Name = 'THGBMHG8C4LBAIRA4G';
        customProduct2.Item_Status__c = 'Active';
        customProduct2.BU__c = 'X66';
        customProduct2.CELL__c = 'eD2';
        customProduct2.DR__c = '15n';
        customProduct2.PKG__c = 'BGA';
        customProduct2.Design__c = '-';
        customProduct2.Product_Type__c = 'eMMC';
        // BU/Product Type/DR/Cell/PKG/Design/DWPD/User Capacity
        //customProduct2.Item_Name__c = customProduct2.BU__c + '/' + customProduct2.Product_Type__c + '/' + customProduct2.DR__c + '/' + customProduct2.CELL__c + '/' + customProduct2.PKG__c + '/' + customProduct2.Design__c + '/' + customProduct2.DWPD__c + '/' + customProduct2.User_Capacity__c;   
        insert customProduct2;
        system.assertEquals(1, [select Id from Product2].size());
        
        MSGA_M_One_Product__c customProduct3 = new MSGA_M_One_Product__c();
        customProduct3.Name = 'THGBMHG8C4LBAIRA4J';
        customProduct3.Item_Status__c = 'Active';
        customProduct3.BU__c = 'X67';
        customProduct3.CELL__c = 'eD2';
        customProduct3.DR__c = '15n';
        customProduct3.PKG__c = 'BGA';
        customProduct3.Design__c = '-';
        customProduct3.Product_Type__c = 'eMMC';
        // BU/Product Type/DR/Cell/PKG/Design/DWPD/User Capacity
        //customProduct3.Item_Name__c = customProduct3.BU__c + '/' + customProduct3.Product_Type__c + '/' + customProduct3.DR__c + '/' + customProduct3.CELL__c + '/' + customProduct3.PKG__c + '/' + customProduct3.Design__c + '/' + customProduct3.DWPD__c + '/' + customProduct3.User_Capacity__c;   
        insert customProduct3;
        system.assertEquals(2, [select Id from Product2].size());
        system.assertEquals(2, [select Id from PricebookEntry].size());*/
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
        MSGA_M_One_Product__c customProduct = new MSGA_M_One_Product__c();
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
        system.assertEquals('X66/eMMC/15n/eD2/BGA/-/1234/', [select Id, DWPD__c, Name from Product2 where Id = :prod.Product__c].Name);
    	
        
    
    }
}