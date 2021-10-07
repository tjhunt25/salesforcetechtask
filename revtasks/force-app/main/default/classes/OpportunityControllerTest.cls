@isTest
public class OpportunityControllerTest {
    @testSetup static void createTestData() {
        Opportunity opp = new Opportunity();
        opp.Name = 'Test';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today() + 100;
        insert opp;
    }
    testMethod static void validateRetrieveOpps() {
        Test.startTest();
        String opps = OpportunityController.retrieveOpportunities();
        Test.stopTest();
        System.assert(opps != null);
    }
    testMethod static void validateOppStages() {
        Test.startTest();
        	String stages = OpportunityController.retrieveStages();
        Test.stopTest();
        System.assert(stages != null);
    }
}