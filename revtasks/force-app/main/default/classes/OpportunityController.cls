public with sharing class OpportunityController {
    /*
     * @description: Retrieves all opportunity records that the current user has access to 
	 */ 
    @AuraEnabled
    public static String retrieveOpportunities() {
        List<Opportunity> opportunities = [SELECT Id, Name, StageName FROM Opportunity];
        if(!opportunities.isEmpty()) {
            return JSON.serialize(opportunities);
        }
        return null;
    }
    /*
     * @description: Retrieves the Opportunity Stage picklist values
	 */ 
    @AuraEnabled
    public static String retrieveStages() {
        Map<String, String> options = new Map<String, String>();
        Schema.DescribeFieldResult fieldResult = Opportunity.StageName.getDescribe();
        List<Schema.PicklistEntry> picklistValues = fieldResult.getPicklistValues();
        options.put('All Opportunities', null);
        for(Schema.PicklistEntry picklistValue : picklistValues) {
            options.put(picklistValue.getLabel(), picklistValue.getValue());
        }     
        return JSON.serialize(options);
    }
}