public class ConversionPageController {
    /*
     * @description: Http callout to get the conversion rates from Fixer.io
	 */ 
    @AuraEnabled
    public static String getConversionRates(String currencies) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://data.fixer.io/api/latest?access_key=1046fab89af48ee5d4d860eb732c7792&symbols='+currencies);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            System.debug('body: '+response.getBody());
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
			Map<String, Object> rates = (Map<String, Object>) results.get('rates');
            return JSON.serialize(rates);
        }
        return null;
    }
}