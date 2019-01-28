//Pagination
TwilioSF.TwilioApiClient client = new TwilioSF.TwilioApiClient();
client.addUrlPart('Accounts');
client.addUrlPart('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
client.addUrlPart('Messages');
client.addUrlPart('.json');


TwilioSF.TwilioApiClientResponse response = client.doGet();
String nextPage  = response.getTwilioJsonParser().get('next_page_uri').getString();
client.setNextUrl(nextPage);
while (client.hasNextPage()) {
    response = client.doGetNext();
    if(response.responseBody != null){
        nextPage  = response.getTwilioJsonParser().get('next_page_uri').getString();
        client.setNextUrl(nextPage);
    }
}
