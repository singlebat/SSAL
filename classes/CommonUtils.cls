public class CommonUtils {
    
    public static boolean isRun = false;
    
    /**
     * オブジェクトの全項目取得
     *
     * @param objType         SObject
     * @param excludeFields   不要の項目
     * @return                SQL文
     */
    public static String getCustomFieldNames(Schema.SObjectType objType, Set<String> excludeFields) {
        String s = '';
        String delimiter = '';
        Map<string,Sobjectfield> fieldMap = objType.getDescribe().fields.getmap();
        for (String fieldName : fieldMap.keySet()) {
            if(excludeFields == null || !excludeFields.contains(fieldName)){
                s += delimiter + fieldName;
                delimiter = ', ';
            }
        }
        return s;
    }
    
    /**
     * API参照名取得
     *
     * @param fieldMap   項目マップ
     * @param fieldName  項目名
     * @return     　　　API参照名
     */
    public static String getFieldName(Map<string,Sobjectfield> fieldMap, String fieldName) {
        String apiName;
        SObjectField sfield = fieldMap.get(fieldName);
        schema.describefieldresult dfield = sfield.getDescribe();
        apiName = dfield.getName();
        
        return apiName;
    }
    
    public static String getLabel(String objectName, String fieldName)
    {
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType theSchema = schemaMap.get(objectName);
        Map<String, Schema.SObjectField> fieldMap = theSchema.getDescribe().fields.getMap();
        return fieldMap.get(fieldName).getDescribe().getLabel();        
    }
    
    public static Map<String, Integer> getLength(String objectName)
    {
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType theSchema = schemaMap.get(objectName);
        Map<String, Schema.SObjectField> fieldMap = theSchema.getDescribe().fields.getMap();
        Map<String, Integer> lengthMap = new Map<String, Integer>();
        for (String fieldName: fieldMap.keySet()) 
        {
            if(fieldMap.get(fieldName).getDescribe().getType() == Schema.DisplayType.INTEGER)
            {
                lengthMap.put(fieldName, fieldMap.get(fieldName).getDescribe().getLength());
            }
       }
        system.debug('---lengthMap:' + lengthMap); 
        return lengthMap;    
    }

    public static List<TheValueSet> getPickListValuesIntoList(String objectName, String fieldName){
       List<String> pickListValuesList= new List<String>();
        List<TheValueSet> PreValues = new List<TheValueSet>();
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType theSchema = schemaMap.get(objectName);
        Map<String, Schema.SObjectField> fieldMap = theSchema.getDescribe().fields.getMap();
		List<Schema.PicklistEntry> ple = fieldMap.get(fieldName).getDescribe().getPicklistValues();
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
    
    @future(callout=true)
    public static void updatePicklist(String objectName, List<String> fieldNames, List<String> ssdOptions, List<String> encryptionOptions, List<String> formOptions)
    {
        List<MetadataService.CustomField> customFields = new List<MetadataService.CustomField>();
        for(String fieldName : fieldNames)
        {
            List<TheValueSet> preOptions = getPickListValuesIntoList(objectName, fieldName);
            // サンプルリスト値作成
            List<MetadataService.CustomValue> values = new List<MetadataService.CustomValue>();
            Set<String> preValues = new Set<String>();
            for(TheValueSet option : preOptions)
            {
                MetadataService.CustomValue customValue = new MetadataService.CustomValue();
                customValue.fullName = option.value;
                customValue.default_x = option.isdefault;
                customValue.description = '';
                customValue.isActive = option.isactive;
                customValue.label = option.label;
                preValues.add(option.value);
                values.add(customValue);
            }
            List<String> options = new List<String>();
            if(fieldName == 'SSD_I_F__c')
            {
                options = ssdOptions;
            }
            if(fieldName == 'SSD_Encryption__c')
            {
                options = encryptionOptions;
            }
            if(fieldName == 'SSD_Form_Factor__c')
            {
                options = formOptions;
            }
            for(String option : options)
            {
                if(!preValues.contains(option))
                {
                    MetadataService.CustomValue customValue = new MetadataService.CustomValue();
                    customValue.fullName = option;
                    customValue.default_x = false;
                    customValue.description = '';
                    customValue.isActive = true;
                    customValue.label = option;
                    values.add(customValue);
                }
            }
            system.debug('---values:' + values);
            // ValueSet作成
            MetadataService.ValueSet picklistValueSet = new MetadataService.ValueSet();
            MetadataService.ValueSetValuesDefinition valueDefinition = new MetadataService.ValueSetValuesDefinition();
            valueDefinition.value = values;
            valueDefinition.sorted = true;
            picklistValueSet.valueSetDefinition = valueDefinition;
            
            // Picklist項目設定
            MetadataService.CustomField customField = new MetadataService.CustomField();
            customField = new MetadataService.CustomField();
            customField.fullName = objectName + '.' + fieldName;
            customField.label = CommonUtils.getLabel(objectName, fieldName);
            customField.type_x = 'Picklist';
            customField.valueSet = picklistValueSet;
            customFields.add(customField);
        }
        MetadataService.MetadataPort metadataService = new MetadataService.MetadataPort();
        metadataService.SessionHeader = new MetadataService.SessionHeader_element();
        metadataService.SessionHeader.sessionId = UserInfo.getSessionId();
        system.debug('---result:' + metadataService.updateMetadata(customFields));
    }
    
    public static String generateRandomString(Integer len) 
    {
            final String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
            String randStr = '';
            while (randStr.length() < len) {
               Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
               randStr += chars.substring(idx, idx+1);
        }
        return randStr; 
 	}
}