@istest
public class TestAccountContactRelation 
{
    static testmethod void test() {
        Account ac = new Account(Name = 'Test Account');
       	insert ac;
    	contact con = new contact ();
        con.AccountId = ac.id ;
        con.FirstName ='test';
        con.LastName ='test';
        insert con;
       // ac.channelView__Related_Contacts__c =con.id;
//update ac;
       // AccountContactRelation.AccountContactRelation(con.Id);
       AccountContactRelationship.InsertRelation(con.id);
    }
    
}