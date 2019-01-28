@isTest
public class MetadataServiceTest 
{
	public class WebServiceMockImpl implements WebServiceMock
    {
        public void doInvoke(
			Object stub, Object request, Map<String, Object> response,
			String endpoint, String soapAction, String requestName,
			String responseNS, String responseName, String responseType) 
        {
            MetadataService.updateMetadataResponse_element metadataResponse = new MetadataService.updateMetadataResponse_element();
            MetadataService.SaveResult saveresult = new MetadataService.SaveResult();
            saveresult.errors = new List<MetadataService.Error>();
            MetadataService.Error error = new MetadataService.Error();
            List<MetadataService.ExtendedErrorDetails> details = new List<MetadataService.ExtendedErrorDetails>();
            details.add(new MetadataService.ExtendedErrorDetails());
            error.extendedErrorDetails =  new List<MetadataService.ExtendedErrorDetails>();
            error.extendedErrorDetails = details;
            saveresult.errors.add(error);
            saveresult.fullName = 'TestApp';
            saveresult.success = true;
            metadataResponse.result = new List<MetadataService.SaveResult>();
            metadataResponse.result.add(saveresult);
            MetadataService.LookupFilter filter = new MetadataService.LookupFilter();
            MetadataService.ValueSettings setting = new MetadataService.ValueSettings();
            MetadataService.FilterItem item = new MetadataService.FilterItem();
            response.put('response_x', metadataResponse); 
            //response.put('response_x', new MetadataService.updateMetadataResponse_element());
        }
    }
    
    @isTest
    private static void testUpdatePicklistValue()
    {
        // Metadata Web Service mock implementation
        Test.setMock(WebServiceMock.class, new WebServiceMockImpl());
		
		// Create a field
		Test.startTest();
		MetadataService.CustomField customField = new MetadataService.CustomField();
		customField.fullName = 'Test__c.TestField__c';
		customField.label = 'Test Field';
		customField.type_x = 'Text';
		customField.length = 42;
        List<String> fields = new List<String>{'SSD_I_F__c', 'SSD_Encryption__c','SSD_Form_Factor__c'};
        List<String> SSDOptions = new List<String>();
        List<String> EncryptionOptions = new List<String>{'encryption 1'};
        List<String> FormFactorOptions = new List<String>{'ff 1'};
        CommonUtils.updatePicklist('OpportunityLineItem', fields, SSDOptions, EncryptionOptions, FormFactorOptions );
		
		Test.stopTest(); // Assertions are implemented in the AssertMetadataAsyncCallback methods 
        
        /*MetadataService.CustomField customField = (MetadataService.CustomField) items[0].metadata;
			System.assertEquals('Test__c.TestField__c', customField.fullName);
			System.assertEquals('Test Field', customField.label);
			System.assertEquals('Text', customField.type_x);
			System.assertEquals(42, customField.length);*/ 
    }
}