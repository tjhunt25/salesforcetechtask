@isTest
global class ConversionHttpCalloutMock implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"success":true,"timestamp":1632931744,"base":"EUR","date":"2021-09-29","rates":{"JPY":129.88059,"AUD":1.615405}}');
        response.setStatusCode(200);
        return response; 
    }
}