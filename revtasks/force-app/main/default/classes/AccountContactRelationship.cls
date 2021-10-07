public class AccountContactRelationship {
    
    Public static Void InsertRelation (Id contactID){
        Contact con = [ SELECT id, MailingState FROM Contact WHERE ID=:contactID LIMIT 1];
        String State = con.MailingState;
        
        List<Account> acc = [ SELECT id,BillingState FROM Account WHERE BillingState=:State];
        system.debug('AcccountList'+acc);
        List<AccountContactRelation> Acrtoinsert = new List<AccountContactRelation>();
                
        for (Account acc1: acc){
            AccountContactRelation acr = new AccountContactRelation(
                                                AccountId=acc1.Id, 
                								ContactId=con.Id );
                Acrtoinsert.add(acr); 
        }
        system.debug('ACRlist'+Acrtoinsert);
        database.insert(Acrtoinsert,false);
      }      
}