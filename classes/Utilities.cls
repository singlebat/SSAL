public class Utilities 
{
    //public static List<TheValueSet> PreValues;
    public static List<TheValueSet> getPickListValuesIntoList(){
       List<String> pickListValuesList= new List<String>();
        List<TheValueSet> PreValues = new List<TheValueSet>();
		Schema.DescribeFieldResult fieldResult = MSGA_M_One_Product__c.Test_FF__c.getDescribe();
		List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
		for( Schema.PicklistEntry pickListVal : ple){
			pickListValuesList.add(pickListVal.getLabel());
            TheValueSet option = new TheValueSet();
            option.label = pickListVal.getLabel();
            option.value = pickListVal.getValue();
            option.isactive = pickListVal.isActive();
            option.isdefault = pickListVal.isDefaultValue();
            PreValues.add(option);
		}   
        
        system.debug('----pre values:' + PreValues);
		return PreValues;
    }
    
    public class TheValueSet
    {
        public string label {get; set; }
        public string value {get; set; }
        public boolean isActive {get; set; }
        public boolean isdefault {get; set; }
        public TheValueSet(){ }
    }
    public static void updatePicklist()
    {
        List<TheValueSet> preOptions = getPickListValuesIntoList();
        // サンプルリスト値作成
        List<MetadataService.CustomValue> values = new List<MetadataService.CustomValue>();
        for(TheValueSet option : preOptions)
        {
            MetadataService.CustomValue customValue = new MetadataService.CustomValue();
            customValue.fullName = option.value;
            customValue.default_x = option.isdefault;
            customValue.description = '';
            customValue.isActive = option.isactive;
            customValue.label = option.label;
            values.add(customValue);
        }
        for(Integer i=1; i<5; i++)
        {
            MetadataService.CustomValue customValue = new MetadataService.CustomValue();
            customValue.fullName = 'accel'+String.valueOf(i);
            customValue.default_x = false;
            customValue.description = '';
            customValue.isActive = true;
            customValue.label = 'accel'+String.valueOf(i);
            values.add(customValue);
        }
        system.debug('---values:' + values);
        // ValueSet作成
        MetadataService.ValueSet picklistValueSet = new MetadataService.ValueSet();
        MetadataService.ValueSetValuesDefinition valueDefinition = new MetadataService.ValueSetValuesDefinition();
        valueDefinition.value = values;
        valueDefinition.sorted = false;
        picklistValueSet.valueSetDefinition = valueDefinition;
        
        // Picklist項目設定
        MetadataService.CustomField customField = new MetadataService.CustomField();
        /*MetadataService.CustomField customField =
            (MetadataService.CustomField) service.readMetadata('CustomField',
                new String[] { 'Lead.picklist__c' }).getRecords()[0];*/
        customField = new MetadataService.CustomField();
        customField.fullName = 'MSGA_M_One_Product__c.Test_FF__c';
        customField.label = 'test';
        customField.type_x = 'Picklist';
        customField.valueSet = picklistValueSet;
        //customField.valueSet.add(picklistValueSet);
        
        // メタデータ更新処理
        MetadataService.MetadataPort metadataService = new MetadataService.MetadataPort();
        metadataService.SessionHeader = new MetadataService.SessionHeader_element();
        metadataService.SessionHeader.sessionId = UserInfo.getSessionId();
        system.debug('---result:' + metadataService.updateMetadata(new MetadataService.CustomField[]{customField}));
    }
}