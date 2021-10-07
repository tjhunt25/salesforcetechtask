@isTest
private class TestpreferredContactRecordUpdate {
    static testmethod void test() {
        // Create test accounts to be updated by batch
       
        Account ac = new Account(Name = 'Test Account');
       	insert ac;
    	contact con = new contact ();
        con.AccountId = ac.id ;
        con.FirstName ='test';
        con.LastName ='test';
        insert con;
        con.lastName ='test1';
        Test.startTest();
        preferredContactRecordUpdate b = new preferredContactRecordUpdate();
        Database.executeBatch(b);
       
        Test.stopTest();
       
    }
}