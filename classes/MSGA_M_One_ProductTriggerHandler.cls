public class MSGA_M_One_ProductTriggerHandler 
{
	public void onBefore(List<MSGA_M_One_Product__c> newMap)
    {
        Map<String, Integer> lengthMap = new Map<String, Integer>();
        lengthMap = CommonUtils.getLength('MSGA_M_One_Product__c');
        
        // Get Existing Products
        List<String> prodNamesSet = new List<String>();
        List<Product2> prodList = new List<Product2>();
        Map<String, Id> prodMap = new Map<String, Id>();
        for(Product2 pro : [select Id, Name from Product2 where IsActive = true])
        {
            prodNamesSet.add(pro.Name);
            prodMap.put(pro.Name, pro.Id);
        }

        for(MSGA_M_One_Product__c prod : newMap)
        {
            system.debug('---in before trigger:' + prod);
            prod.BU__c = String.isBlank(prod.BU__c) ? '' :  prod.BU__c ;
            prod.DR__c = String.isBlank(prod.DR__c) ? '' :  prod.DR__c ;
            prod.CELL__c = String.isBlank(prod.CELL__c) ? '' :  prod.CELL__c ;
            prod.PKG__c = String.isBlank(prod.PKG__c) ? '' :  prod.PKG__c ;
            prod.Design__c =  String.isBlank(prod.Design__c) ? '' :  prod.Design__c ;
            prod.DWPD__c =  String.isBlank(prod.DWPD__c) ? '' :  prod.DWPD__c; 
            prod.User_Capacity__c =   String.isBlank(prod.User_Capacity__c) ? '' :  prod.User_Capacity__c;
            prod.Item_Name__c = prod.BU__c + '/' + 
                                prod.Product_Type__c + '/' + 
                                prod.DR__c + '/' + 
                                prod.CELL__c + '/' + 
                                prod.PKG__c + '/' + 
                                prod.Design__c + '/' + 
                                prod.DWPD__c + '/' + 
                                prod.User_Capacity__c;
			if(!String.isBlank(prod.GLOBAL_ITEM_NAME__c))
            {
                prod.Name = prod.GLOBAL_ITEM_NAME__c;
            }
            //prod.Design__c = 'test1234';
            
            // Connect to Product if there is already a product existing in Product object
            system.debug('---in before trigger msga product:' + prod);
            if(prodNamesSet.contains(prod.Item_Name__c))
            {
                prod.Product__c = prodMap.get(prod.Item_Name__c);
            }
            system.debug('---in before trigger msga product:' + prod);
            //prod.put('Name', 'test123');
            //Integer count = 0;
            //system.debug('---has name field:' + lengthMap.containsKey('name'));
            /*for (String fieldName : lengthMap.keySet()) 
            {
                system.debug('-- before field:' + prod.get(fieldName));
                if(String.valueOf((prod.get(fieldName))).length() > lengthMap.get(fieldName))
                {
                    //prod.put(fieldName, String.valueOf(prod.get(fieldName)).substring(0, lengthMap.get(fieldName)));
                    prod.put(fieldName, String.valueOf(prod.get(fieldName)).substring(0, lengthMap.get(fieldName)));
                    count++;
                }
                
                system.debug('-- before field:' + prod.get(fieldName));
            }
            if(count > 0)
            {
                prod.Different_from_M_ONE__c = true;
            }
            */
            //prod.Block__c = (prod.Block__c).substring(0, 10);
            //system.debug('###prod block:' + prod.Block__c);
           
            
        }        
    }
    public void onAfterInsert(List<MSGA_M_One_Product__c> newList)
    {
        insertProducts(newList);
    }
    public void onAfterUpdate(Map<Id, MSGA_M_One_Product__c> newMap, Map<Id, MSGA_M_One_Product__c> oldMap)
    {
        List<MSGA_M_One_Product__c> prodsList = new List<MSGA_M_One_Product__c>();
        for(MSGA_M_One_Product__c prod : newMap.values())
        {
			//if(newMap.get(prod.Id).Item_Name__c != oldMap.get(prod.Id).Item_Name__c)
            //{
                prodsList.add(prod);
            //}
        }
        insertProducts(prodsList);
    }
    
    public void insertProducts(List<MSGA_M_One_Product__c> customProds)
    {
        List<String> prodNamesSet = new List<String>();
        List<Product2> prodList = new List<Product2>();
        Map<String, Id> prodMap = new Map<String, Id>();
        for(Product2 prod : [select Id, Name from Product2 where IsActive = true])
        {
            prodNamesSet.add(prod.Name);
            prodMap.put(prod.Name, prod.Id);
        }
        system.debug('---names:' + prodNamesSet);
        
        List<String> SSDOptions = new List<String>();
        List<String> EncryptionOptions =  new List<String>();
        List<String> FormFactorOptions = new List<String>();
        Map<MSGA_M_One_Product__c, String> MSGAMap = new Map<MSGA_M_One_Product__c, String>();
        
        List<Id> MSGAIDs = new List<Id>();
        system.debug('---in after update msga product:' + customProds);
        for(MSGA_M_One_Product__c prod : customProds)
        {
            system.debug('---item name:' + prod.Item_Name__c);
            SSDOptions.add(prod.SSD_IF__c);
            EncryptionOptions.add(prod.Encryption__c);
            FormFactorOptions.add(prod.Form_Factor__c);
            if(!prodNamesSet.contains(prod.Item_Name__c))
            {
                Product2 newProd = new Product2();
                //newProd.Name = prod.Item_Name__c;
                newProd.BU__c = prod.BU__c;
                newProd.Business_Unit__c = prod.Product_Type__c;
                newProd.CELL__c = prod.CELL__c;
                newProd.Design__c = prod.Design__c;
                newProd.DR__c = prod.DR__c;
                try{
                     if(String.isBlank(prod.DWPD__c))
                    {
                        newProd.DWPD__c = null;
                    }
                    else
                    {
                        if((prod.DWPD__c).isNumeric())
                        {
                            newProd.DWPD__c = Decimal.valueOf(prod.DWPD__c);
                        }
                    }
                }catch(Exception ex)
                {
                    system.debug('---ex:' + ex);
                    newProd.DWPD__c = null;
                }
               
                try
                {
                    if(String.isBlank(prod.User_Capacity__c))
                    {
                        system.debug('--- is blank');
                        newProd.User_Capacity__c = null;
                    }
                    else
                    {
                        if((prod.User_Capacity__c).isNumeric())
                        {
                            newProd.User_Capacity__c = Decimal.valueOf(prod.User_Capacity__c);
                            system.debug('--- is number');
                        }
                        else
                        {
                            system.debug('--- is not number');
                            newProd.User_Capacity__c = null;
                        }
                            
                    }
                }catch(Exception ex)
                {
                    system.debug('---ex:' + ex);
                    newProd.User_Capacity__c = null;
                    
                }
                
                
                
                newProd.PKG__c = prod.PKG__c;
                //newProd.User_Capacity__c = String.isBlank(prod.User_Capacity__c) ? null : Decimal.valueOf(prod.User_Capacity__c);
                newProd.Production_Status__c = prod.Item_Status__c;
                String DWPD = newProd.DWPD__c == null ? '' : String.valueOf(newProd.DWPD__c);
                String UC = newProd.User_Capacity__c == null ? '' : String.valueOf(newProd.User_Capacity__c);
                
                newProd.Name =  newProd.BU__c + '/' + 
                                newProd.Business_Unit__c + '/' + 
                                newProd.DR__c + '/' + 
                                newProd.CELL__c + '/' + 
                                newProd.PKG__c + '/' + 
                                newProd.Design__c + '/' + 
                                DWPD + '/' + UC;
                system.debug('--- new prodcut name:' + newProd.Name);
                
                if(!(prod.Item_Status__c == 'Inactive' || prod.Item_Status__c == 'Obsolete'))
                {
                    newProd.IsActive = true;
                    prodList.add(newProd);
                }
                MSGAMap.put(prod, prod.Item_Name__c);
                MSGAIds.add(prod.Id);
                
                system.debug('---new prod:' + newProd);
            }
        }
        
        // Update Picklist Values
        /*CommonUtils.updatePicklist('OpportunityLineItem', 'SSD_I_F__c', SSDOptions);
        CommonUtils.updatePicklist('OpportunityLineItem', 'SSD_Encryption__c', EncryptionOptions);
        CommonUtils.updatePicklist('OpportunityLineItem', 'SSD_Form_Factor__c', FormFactorOptions);*/
        
        insert prodList;
        
        system.debug('--- prodList Id:' + prodList);
        Set<Id> Ids = new Set<Id>();
        Map<String, Id> existingProdMap = new Map<String, Id>();
        for(Product2 insertedProd : prodList)
        {
            //Ids.add(insertedProd.Id);
            existingProdMap.put(insertedProd.Name, insertedProd.Id);
            
        }
        system.debug('--- product item name map:' + existingProdMap);
        List<MSGA_M_One_Product__c> updateList = new List<MSGA_M_One_Product__c>();
        for(MSGA_M_One_Product__c pp : [select Id, Product__c, Item_Name__c from MSGA_M_One_Product__c where Id in :MSGAIds])
        {
            system.debug('--- msga product item name:' + pp.Item_Name__c);
            pp.Product__c = existingProdMap.get(pp.Item_Name__c);
            
            updateList.add(pp);
        }
        
        system.debug('---updated list:' + updateList);
        //CommonUtils.isRun = true;
        update updateList;
        //CommonUtils.isRun = true;
        
        List<PricebookEntry> entries = new List<PricebookEntry>(); 
        Id bookId;
        if(!Test.isRunningTest())
        {
            bookId = [select Id from Pricebook2 where isStandard = true][0].Id;
        }
        else
        {
             bookId = Test.getStandardPricebookId();
        }
        
        for(Product2 prod : prodList)
        {
            PricebookEntry entry = new PricebookEntry();
            entry.Pricebook2Id = bookId;
            entry.Product2Id = prod.Id;
            entry.UnitPrice = 0;
            entry.isActive = true;
            entries.add(entry);
        }
        insert entries;
    }
}