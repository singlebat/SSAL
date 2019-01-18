public class CloneWithProductsController {
	@AuraEnabled
    public static Opportunity getProject(Id projectId)
    {
    	    return [select Id, Name from Opportunity where Id = :projectId];
	}
    
    @AuraEnabled
    public static void cloneWithProducts(Id projectId)
    {
        
    }
}