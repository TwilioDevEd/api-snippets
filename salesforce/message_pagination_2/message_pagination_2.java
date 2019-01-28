//Pagination Example
TwilioSF.TwilioApiClient client = new TwilioSF.TwilioApiClient();
client.addUrlPart('Accounts');
client.addUrlPart('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
client.addUrlPart('Messages');
client.addUrlPart('.json');


TwilioSF.TwilioApiClientResponse response = client.doGet();
String nextPage  = response.getTwilioJsonParser().get('next_page_uri').getString();
client.setNextUrl(nextPage);
if(client.hasNextPage()){
   response = client.doGetNext();

   String previousPage = response.getTwilioJsonParser().get('previous_page_uri').getString();
   client.setPreviousUrl(previousPage);

   if(client.hasPreviousPage()){
       response = client.doGetPrevious();
       system.debug(response.getTwilioJsonParser().get('uri').getString());
   }
}
