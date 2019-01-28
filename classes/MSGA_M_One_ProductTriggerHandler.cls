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
            prod.Item_Name__c = (prod.Item_Name__c).replace('null', '');
			if(!String.isBlank(prod.GLOBAL_ITEM_NAME__c))
            {
                prod.Name = prod.GLOBAL_ITEM_NAME__c;
            }
            
            // Connect to Product if there is already a product existing in Product object
            system.debug('---in before trigger msga product:' + prod);
            if(prodNamesSet.contains(prod.Item_Name__c))
            {
                prod.Product__c = prodMap.get(prod.Item_Name__c);
            }
            system.debug('---in before trigger msga product:' + prod);
           
        }        
    }
    public void onAfterInsert(List<MSGA_M_One_Product__c> newList)
    {
        insertProducts(newList);
        
    }
    public void onAfterUpdate(Map<Id, MSGA_M_One_Product__c> newMap, Map<Id, MSGA_M_One_Product__c> oldMap)
    {
        List<MSGA_M_One_Product__c> prodsList = new List<MSGA_M_One_Product__c>();
        Map<String, MSGA_M_One_Product__c> uniqueProds = new Map<String, MSGA_M_One_Product__c>();
        for(MSGA_M_One_Product__c prod : newMap.values())
        {
			//if(newMap.get(prod.Id).Item_Name__c != oldMap.get(prod.Id).Item_Name__c)
            //{
                prodsList.add(prod);
            //}
            //uniqueProds.put(prod.Item_Name__c, prod);
        }
        insertProducts(prodsList);
    }
    
    public void insertProducts(List<MSGA_M_One_Product__c> customProds)
    {
        List<String> prodNamesSet = new List<String>();
        Set<Product2> prodList = new Set<Product2>();
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
        Map<String, String> itemsNameMap = new Map<String, String>();
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
                //try{
                Integer d_length = Schema.SObjectType.Product2.fields.DWPD__c.getPrecision();
                system.debug('--d_length:' + d_length);
                if(String.isBlank(prod.DWPD__c))
                {
                    newProd.DWPD__c = null;
                }
                else
                {
                    if((prod.DWPD__c).isNumeric())
                    {
                        String dwpd = prod.DWPD__c;
                        if((prod.DWPD__c).length() > d_length)
                        {
                            dwpd = (prod.DWPD__c).substring(0,d_length);
                        }
                        newProd.DWPD__c = Decimal.valueOf(dwpd);
                    }
                }
                /*}catch(Exception ex)
                {
                    system.debug('---ex:' + ex);
                    newProd.DWPD__c = null;
                }*/
               
                //try
                //{
                Integer uc_length = Schema.SObjectType.Product2.fields.User_Capacity__c.getPrecision() - Schema.SObjectType.Product2.fields.User_Capacity__c.getScale();
                system.debug('--uc length:' + uc_length);
                
                if(String.isBlank(prod.User_Capacity__c))
                {
                    system.debug('--- is blank');
                    newProd.User_Capacity__c = null;
                }
                else
                {
                    if((prod.User_Capacity__c).isNumeric())
                    {
                        String uc = prod.User_Capacity__c;
                        if((prod.User_Capacity__c).length()> uc_length)
                        {
                            uc = (prod.User_Capacity__c).substring(uc.length() - uc_length, uc.length());
                        }
                        newProd.User_Capacity__c = Decimal.valueOf(uc);
                        system.debug('--- is number');
                    }
                    else
                    {
                        system.debug('--- is not number');
                        newProd.User_Capacity__c = null;
                    }
                }
                /*}catch(Exception ex)
                {
                    system.debug('---ex:' + ex);
                    newProd.User_Capacity__c = null;
                    
                }*/
                
                newProd.PKG__c = prod.PKG__c;
                newProd.Production_Status__c = prod.Item_Status__c;
                String DWPD = newProd.DWPD__c == null ? '' : String.valueOf(newProd.DWPD__c);
                String UC = newProd.User_Capacity__c == null ? '' : String.valueOf(newProd.User_Capacity__c);
                newProd.Name =   newProd.BU__c + '/' + 
                                 newProd.Business_Unit__c + '/' + 
                                 newProd.DR__c + '/' + 
                                 newProd.CELL__c + '/' + 
                                 newProd.PKG__c + '/' + 
                                 newProd.Design__c + '/' + 
                                 DWPD + '/' + UC;
                newProd.Name = (newProd.Name).replace('null', '');
                system.debug('--- new prodcut name:' + newProd.Name);
                
                // Active, Active-Npp, DISCON, engineer, Phase-Out, Pre-Active, No Promotion
                if(!String.isBlank(prod.Item_Status__c) && ((prod.Item_Status__c).equalsIgnoreCase('Active') || (prod.Item_Status__c).equalsIgnoreCase('Active-Npp') || (prod.Item_Status__c).equalsIgnoreCase('DISCON') || (prod.Item_Status__c).equalsIgnoreCase('engineer') ||(prod.Item_Status__c).equalsIgnoreCase('Phase-Out') || (prod.Item_Status__c).equalsIgnoreCase('Pre-Active') || (prod.Item_Status__c).equalsIgnoreCase('No Promotion')))
                {
                    newProd.IsActive = true;
                    prodList.add(newProd);
                }
                MSGAMap.put(prod, prod.Item_Name__c);
                MSGAIds.add(prod.Id);
                itemsNameMap.put(prod.Item_Name__c, newProd.Name);                
                system.debug('---new prod:' + newProd);
            }
        }
        
        // Update Picklist Values
        List<String> fields = new List<String>{'SSD_I_F__c', 'SSD_Encryption__c','SSD_Form_Factor__c'};
        CommonUtils.updatePicklist('OpportunityLineItem', fields, SSDOptions, EncryptionOptions, FormFactorOptions );
        List<Product2> newList = new List<Product2>();
        newList.addAll(prodList);
        system.debug('----new unique product list:' + newList);
        insert newList;
        
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
            if(existingProdMap.get(pp.Item_Name__c)==null)
            {
                pp.Product__c = existingProdMap.get(itemsNameMap.get(pp.Item_Name__c));
            }
            else
            {
                pp.Product__c = existingProdMap.get(pp.Item_Name__c);
            }
                        
            updateList.add(pp);
        }
        
        system.debug('---updated list:' + updateList);
        update updateList;
        
        List<PricebookEntry> entries = new List<PricebookEntry>(); 
        Id bookId;
        //Integer i = 0;
        /*if(!Test.isRunningTest())
        {
            bookId = [select Id from Pricebook2 where isStandard = true][0].Id;
        }
        else
        {
             bookId = Test.getStandardPricebookId();
        }*/
        bookId = Test.isRunningTest() ? Test.getStandardPricebookId() : [select Id from Pricebook2 where isStandard = true][0].Id;
        
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