public class MetadataService {

	public static String API_VERSION = '44.0';
	public static String SOAP_M_URI = 'http://soap.sforce.com/2006/04/metadata';

	public virtual class Metadata {
		public String fullName;
	}

	public class CustomValue extends Metadata {
		public String type = 'CustomValue';
		public String fullName;
		private String[] fullName_type_info = new String[]{'fullName',SOAP_M_URI,null,'0','1','false'};
		public String color;
		public Boolean default_x;
		public String description;
		public Boolean isActive;
		public String label;
		private String[] color_type_info = new String[]{'color',SOAP_M_URI,null,'0','1','false'};
		private String[] default_x_type_info = new String[]{'default',SOAP_M_URI,null,'1','1','false'};
		private String[] description_type_info = new String[]{'description',SOAP_M_URI,null,'0','1','false'};
		private String[] isActive_type_info = new String[]{'isActive',SOAP_M_URI,null,'0','1','false'};
		private String[] label_type_info = new String[]{'label',SOAP_M_URI,null,'0','1','false'};
		private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
		private String[] type_att_info = new String[]{'xsi:type'};
		private String[] field_order_type_info = new String[]{'fullName','color','default_x','description','isActive','label'};
	}

	public class CustomField extends Metadata {
		public String type = 'CustomField';
		public String fullName;
		private String[] fullName_type_info = new String[]{'fullName',SOAP_M_URI,null,'0','1','false'};
		public String businessOwnerGroup;
		public String businessOwnerUser;
		public String businessStatus;
		public Boolean caseSensitive;
		public String customDataType;
		public String defaultValue;
		public String deleteConstraint;
		public Boolean deprecated;
		public String description;
		public String displayFormat;
		public Boolean displayLocationInDecimal;
		public Boolean encrypted;
		public Boolean escapeMarkup;
		public String externalDeveloperName;
		public Boolean externalId;
		public String fieldManageability;
		public String formula;
		public String formulaTreatBlanksAs;
		public String inlineHelpText;
		public Boolean isConvertLeadDisabled;
		public Boolean isFilteringDisabled;
		public Boolean isNameField;
		public Boolean isSortingDisabled;
		public String label;
		public Integer length;
		public MetadataService.LookupFilter lookupFilter;
		public String maskChar;
		public String maskType;
		public String metadataRelationshipControllingField;
		public Boolean populateExistingRows;
		public Integer precision;
		public String referenceTargetField;
		public String referenceTo;
		public String relationshipLabel;
		public String relationshipName;
		public Integer relationshipOrder;
		public Boolean reparentableMasterDetail;
		public Boolean required;
		public Boolean restrictedAdminField;
		public Integer scale;
		public String securityClassification;
		public Integer startingNumber;
		public Boolean stripMarkup;
		public String summarizedField;
		public MetadataService.FilterItem[] summaryFilterItems;
		public String summaryForeignKey;
		public String summaryOperation;
		public Boolean trackFeedHistory;
		public Boolean trackHistory;
		public Boolean trackTrending;
		public String type_x;
		public Boolean unique;
		public MetadataService.ValueSet valueSet;
		public Integer visibleLines;
		public Boolean writeRequiresMasterRead;
		private String[] businessOwnerGroup_type_info = new String[]{'businessOwnerGroup',SOAP_M_URI,null,'0','1','false'};
		private String[] businessOwnerUser_type_info = new String[]{'businessOwnerUser',SOAP_M_URI,null,'0','1','false'};
		private String[] businessStatus_type_info = new String[]{'businessStatus',SOAP_M_URI,null,'0','1','false'};
		private String[] caseSensitive_type_info = new String[]{'caseSensitive',SOAP_M_URI,null,'0','1','false'};
		private String[] customDataType_type_info = new String[]{'customDataType',SOAP_M_URI,null,'0','1','false'};
		private String[] defaultValue_type_info = new String[]{'defaultValue',SOAP_M_URI,null,'0','1','false'};
		private String[] deleteConstraint_type_info = new String[]{'deleteConstraint',SOAP_M_URI,null,'0','1','false'};
		private String[] deprecated_type_info = new String[]{'deprecated',SOAP_M_URI,null,'0','1','false'};
		private String[] description_type_info = new String[]{'description',SOAP_M_URI,null,'0','1','false'};
		private String[] displayFormat_type_info = new String[]{'displayFormat',SOAP_M_URI,null,'0','1','false'};
		private String[] displayLocationInDecimal_type_info = new String[]{'displayLocationInDecimal',SOAP_M_URI,null,'0','1','false'};
		private String[] encrypted_type_info = new String[]{'encrypted',SOAP_M_URI,null,'0','1','false'};
		private String[] escapeMarkup_type_info = new String[]{'escapeMarkup',SOAP_M_URI,null,'0','1','false'};
		private String[] externalDeveloperName_type_info = new String[]{'externalDeveloperName',SOAP_M_URI,null,'0','1','false'};
		private String[] externalId_type_info = new String[]{'externalId',SOAP_M_URI,null,'0','1','false'};
		private String[] fieldManageability_type_info = new String[]{'fieldManageability',SOAP_M_URI,null,'0','1','false'};
		private String[] formula_type_info = new String[]{'formula',SOAP_M_URI,null,'0','1','false'};
		private String[] formulaTreatBlanksAs_type_info = new String[]{'formulaTreatBlanksAs',SOAP_M_URI,null,'0','1','false'};
		private String[] inlineHelpText_type_info = new String[]{'inlineHelpText',SOAP_M_URI,null,'0','1','false'};
		private String[] isConvertLeadDisabled_type_info = new String[]{'isConvertLeadDisabled',SOAP_M_URI,null,'0','1','false'};
		private String[] isFilteringDisabled_type_info = new String[]{'isFilteringDisabled',SOAP_M_URI,null,'0','1','false'};
		private String[] isNameField_type_info = new String[]{'isNameField',SOAP_M_URI,null,'0','1','false'};
		private String[] isSortingDisabled_type_info = new String[]{'isSortingDisabled',SOAP_M_URI,null,'0','1','false'};
		private String[] label_type_info = new String[]{'label',SOAP_M_URI,null,'0','1','false'};
		private String[] length_type_info = new String[]{'length',SOAP_M_URI,null,'0','1','false'};
		private String[] lookupFilter_type_info = new String[]{'lookupFilter',SOAP_M_URI,null,'0','1','false'};
		private String[] maskChar_type_info = new String[]{'maskChar',SOAP_M_URI,null,'0','1','false'};
		private String[] maskType_type_info = new String[]{'maskType',SOAP_M_URI,null,'0','1','false'};
		private String[] metadataRelationshipControllingField_type_info = new String[]{'metadataRelationshipControllingField',SOAP_M_URI,null,'0','1','false'};
		private String[] populateExistingRows_type_info = new String[]{'populateExistingRows',SOAP_M_URI,null,'0','1','false'};
		private String[] precision_type_info = new String[]{'precision',SOAP_M_URI,null,'0','1','false'};
		private String[] referenceTargetField_type_info = new String[]{'referenceTargetField',SOAP_M_URI,null,'0','1','false'};
		private String[] referenceTo_type_info = new String[]{'referenceTo',SOAP_M_URI,null,'0','1','false'};
		private String[] relationshipLabel_type_info = new String[]{'relationshipLabel',SOAP_M_URI,null,'0','1','false'};
		private String[] relationshipName_type_info = new String[]{'relationshipName',SOAP_M_URI,null,'0','1','false'};
		private String[] relationshipOrder_type_info = new String[]{'relationshipOrder',SOAP_M_URI,null,'0','1','false'};
		private String[] reparentableMasterDetail_type_info = new String[]{'reparentableMasterDetail',SOAP_M_URI,null,'0','1','false'};
		private String[] required_type_info = new String[]{'required',SOAP_M_URI,null,'0','1','false'};
		private String[] restrictedAdminField_type_info = new String[]{'restrictedAdminField',SOAP_M_URI,null,'0','1','false'};
		private String[] scale_type_info = new String[]{'scale',SOAP_M_URI,null,'0','1','false'};
		private String[] securityClassification_type_info = new String[]{'securityClassification',SOAP_M_URI,null,'0','1','false'};
		private String[] startingNumber_type_info = new String[]{'startingNumber',SOAP_M_URI,null,'0','1','false'};
		private String[] stripMarkup_type_info = new String[]{'stripMarkup',SOAP_M_URI,null,'0','1','false'};
		private String[] summarizedField_type_info = new String[]{'summarizedField',SOAP_M_URI,null,'0','1','false'};
		private String[] summaryFilterItems_type_info = new String[]{'summaryFilterItems',SOAP_M_URI,null,'0','-1','false'};
		private String[] summaryForeignKey_type_info = new String[]{'summaryForeignKey',SOAP_M_URI,null,'0','1','false'};
		private String[] summaryOperation_type_info = new String[]{'summaryOperation',SOAP_M_URI,null,'0','1','false'};
		private String[] trackFeedHistory_type_info = new String[]{'trackFeedHistory',SOAP_M_URI,null,'0','1','false'};
		private String[] trackHistory_type_info = new String[]{'trackHistory',SOAP_M_URI,null,'0','1','false'};
		private String[] trackTrending_type_info = new String[]{'trackTrending',SOAP_M_URI,null,'0','1','false'};
		private String[] type_x_type_info = new String[]{'type',SOAP_M_URI,null,'0','1','false'};
		private String[] unique_type_info = new String[]{'unique',SOAP_M_URI,null,'0','1','false'};
		private String[] valueSet_type_info = new String[]{'valueSet',SOAP_M_URI,null,'0','1','false'};
		private String[] visibleLines_type_info = new String[]{'visibleLines',SOAP_M_URI,null,'0','1','false'};
		private String[] writeRequiresMasterRead_type_info = new String[]{'writeRequiresMasterRead',SOAP_M_URI,null,'0','1','false'};
		private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
		private String[] type_att_info = new String[]{'xsi:type'};
		private String[] field_order_type_info = new String[]{'fullName', 'businessOwnerGroup','businessOwnerUser','businessStatus','caseSensitive','customDataType','defaultValue','deleteConstraint','deprecated','description','displayFormat','displayLocationInDecimal','encrypted','escapeMarkup','externalDeveloperName','externalId','fieldManageability','formula','formulaTreatBlanksAs','inlineHelpText','isConvertLeadDisabled','isFilteringDisabled','isNameField','isSortingDisabled','label','length','lookupFilter','maskChar','maskType','metadataRelationshipControllingField','populateExistingRows','precision','referenceTargetField','referenceTo','relationshipLabel','relationshipName','relationshipOrder','reparentableMasterDetail','required','restrictedAdminField','scale','securityClassification','startingNumber','stripMarkup','summarizedField','summaryFilterItems','summaryForeignKey','summaryOperation','trackFeedHistory','trackHistory','trackTrending','type_x','unique','valueSet','visibleLines','writeRequiresMasterRead'};
	}

	public class ValueSet {
		public String controllingField;
		public Boolean restricted;
		public MetadataService.ValueSetValuesDefinition valueSetDefinition;
		public String valueSetName;
		public MetadataService.ValueSettings[] valueSettings;
		private String[] controllingField_type_info = new String[]{'controllingField',SOAP_M_URI,null,'0','1','false'};
		private String[] restricted_type_info = new String[]{'restricted',SOAP_M_URI,null,'0','1','false'};
		private String[] valueSetDefinition_type_info = new String[]{'valueSetDefinition',SOAP_M_URI,null,'0','1','false'};
		private String[] valueSetName_type_info = new String[]{'valueSetName',SOAP_M_URI,null,'0','1','false'};
		private String[] valueSettings_type_info = new String[]{'valueSettings',SOAP_M_URI,null,'0','-1','false'};
		private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
		private String[] field_order_type_info = new String[]{'controllingField','restricted','valueSetDefinition','valueSetName','valueSettings'};
	}

	public class ValueSettings {
		public String[] controllingFieldValue;
		public String valueName;
		private String[] controllingFieldValue_type_info = new String[]{'controllingFieldValue',SOAP_M_URI,null,'0','-1','false'};
		private String[] valueName_type_info = new String[]{'valueName',SOAP_M_URI,null,'1','1','false'};
		private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
		private String[] field_order_type_info = new String[]{'controllingFieldValue','valueName'};
	}

	public class ValueSetValuesDefinition {
		public Boolean sorted;
		public MetadataService.CustomValue[] value;
		private String[] sorted_type_info = new String[]{'sorted',SOAP_M_URI,null,'1','1','false'};
		private String[] value_type_info = new String[]{'value',SOAP_M_URI,null,'0','-1','false'};
		private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
		private String[] field_order_type_info = new String[]{'sorted','value'};
	}

	public class LookupFilter {
		public Boolean active;
		public String booleanFilter;
		public String description;
		public String errorMessage;
		public MetadataService.FilterItem[] filterItems;
		public String infoMessage;
		public Boolean isOptional;
		private String[] active_type_info = new String[]{'active',SOAP_M_URI,null,'1','1','false'};
		private String[] booleanFilter_type_info = new String[]{'booleanFilter',SOAP_M_URI,null,'0','1','false'};
		private String[] description_type_info = new String[]{'description',SOAP_M_URI,null,'0','1','false'};
		private String[] errorMessage_type_info = new String[]{'errorMessage',SOAP_M_URI,null,'0','1','false'};
		private String[] filterItems_type_info = new String[]{'filterItems',SOAP_M_URI,null,'0','-1','false'};
		private String[] infoMessage_type_info = new String[]{'infoMessage',SOAP_M_URI,null,'0','1','false'};
		private String[] isOptional_type_info = new String[]{'isOptional',SOAP_M_URI,null,'1','1','false'};
		private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
		private String[] field_order_type_info = new String[]{'active','booleanFilter','description','errorMessage','filterItems','infoMessage','isOptional'};
	}

	public class FilterItem {
		public String field;
		public String operation;
		public String value;
		public String valueField;
		private String[] field_type_info = new String[]{'field',SOAP_M_URI,null,'1','1','false'};
		private String[] operation_type_info = new String[]{'operation',SOAP_M_URI,null,'1','1','false'};
		private String[] value_type_info = new String[]{'value',SOAP_M_URI,null,'0','1','false'};
		private String[] valueField_type_info = new String[]{'valueField',SOAP_M_URI,null,'0','1','false'};
		private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
		private String[] field_order_type_info = new String[]{'field','operation','value','valueField'};
	}

	public class SaveResult {
		public MetadataService.Error[] errors;
		public String fullName;
		public Boolean success;
		private String[] errors_type_info = new String[]{'errors',SOAP_M_URI,null,'0','-1','false'};
		private String[] fullName_type_info = new String[]{'fullName',SOAP_M_URI,null,'1','1','false'};
		private String[] success_type_info = new String[]{'success',SOAP_M_URI,null,'1','1','false'};
		private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
		private String[] field_order_type_info = new String[]{'errors','fullName','success'};
	}

	public class Error {
		public MetadataService.ExtendedErrorDetails[] extendedErrorDetails;
		public String[] fields;
		public String message;
		public String statusCode;
		private String[] extendedErrorDetails_type_info = new String[]{'extendedErrorDetails',SOAP_M_URI,null,'0','-1','false'};
		private String[] fields_type_info = new String[]{'fields',SOAP_M_URI,null,'0','-1','false'};
		private String[] message_type_info = new String[]{'message',SOAP_M_URI,null,'1','1','false'};
		private String[] statusCode_type_info = new String[]{'statusCode',SOAP_M_URI,null,'1','1','false'};
		private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
		private String[] field_order_type_info = new String[]{'extendedErrorDetails','fields','message','statusCode'};
	}

	public class ExtendedErrorDetails {
		public String extendedErrorCode;
		private String[] extendedErrorCode_type_info = new String[]{'extendedErrorCode',SOAP_M_URI,null,'1','1','false'};
		private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
		private String[] field_order_type_info = new String[]{'extendedErrorCode'};
	}

	public class SessionHeader_element {
		public String sessionId;
		private String[] sessionId_type_info = new String[]{'sessionId',SOAP_M_URI,null,'1','1','false'};
		private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
		private String[] field_order_type_info = new String[]{'sessionId'};
	}

	public class updateMetadata_element {
		public MetadataService.Metadata[] metadata;
		private String[] metadata_type_info = new String[]{'metadata',SOAP_M_URI,null,'0','-1','false'};
		private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
		private String[] field_order_type_info = new String[]{'metadata'};
	}

	public class updateMetadataResponse_element {
		public MetadataService.SaveResult[] result;
		private String[] result_type_info = new String[]{'result',SOAP_M_URI,null,'0','-1','false'};
		private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
		private String[] field_order_type_info = new String[]{'result'};
	}

	public class MetadataPort {
		public String endpoint_x = URL.getSalesforceBaseUrl().toExternalForm() + '/services/Soap/m/' + API_VERSION;
		public MetadataService.SessionHeader_element SessionHeader;
		private String SessionHeader_hns = 'SessionHeader=' + SOAP_M_URI;
		private String[] ns_map_type_info = new String[]{SOAP_M_URI, 'MetadataService'};
		public MetadataService.SaveResult[] updateMetadata(MetadataService.Metadata[] metadata) {
			MetadataService.updateMetadata_element request_x = new MetadataService.updateMetadata_element();
			request_x.metadata = metadata;
			MetadataService.updateMetadataResponse_element response_x;
			Map<String, MetadataService.updateMetadataResponse_element> response_map_x = new Map<String, MetadataService.updateMetadataResponse_element>();
			response_map_x.put('response_x', response_x);
			WebServiceCallout.invoke(
			  this,
			  request_x,
			  response_map_x,
			  new String[]{endpoint_x,
			  '',
			  SOAP_M_URI,
			  'updateMetadata',
			  SOAP_M_URI,
			  'updateMetadataResponse',
			  'MetadataService.updateMetadataResponse_element'}
			);
			response_x = response_map_x.get('response_x');
			return response_x.result;
		}
	}
}