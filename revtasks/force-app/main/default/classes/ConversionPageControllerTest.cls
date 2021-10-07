@isTest 
public class ConversionPageControllerTest {
    testMethod static void testPostCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new ConversionHttpCalloutMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        String rates = ConversionPageController.getConversionRates('AUD,JPY');
        // Verify that the response received contains fake values
        System.assert(rates != null);
    }
}