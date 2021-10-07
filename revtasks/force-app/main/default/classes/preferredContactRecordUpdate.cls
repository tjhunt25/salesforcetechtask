global class preferredContactRecordUpdate implements Database.Batchable<sObject>  
  {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        String Query = 'SELECT Id,Preferred_Contact_Method__c  FROM Contact';
        return Database.getQueryLocator(Query);
    }
    global void execute(Database.BatchableContext bc, List<Contact> listContacts){
        // process each batch of records
        for(Contact updateContact : listContacts) 
        {        
            // Update the preferred contsct
            
            updateContact.Preferred_Contact_Method__c = 'mobile';
        }
         // Update the contact Record
        update listContacts;
		}
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }    
      
}