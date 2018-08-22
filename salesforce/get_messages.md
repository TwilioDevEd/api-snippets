```
TwilioApiClient client = new TwilioApiClient();
client.addUrlPart('Accounts');
client.addUrlPart('AC91c6dc4cca313b7a23b1b36b4a37e89c');
client.addUrlPart('Messages');
client.addUrlPart('.json');


TwilioApiClientResponse response = client.doGet();

//Get Pagination Next URL
String nextPage  = response.getTwilioJsonParser().get('next_page_uri').getString();
client.setNextUrl(nextPage);

//Validate that the url wasn't null
if(client.hasNextPage()){

    //Call get Next
    response = client.doGetNext();

    //Get Pagination Previous URL
    String previousPage = response.getTwilioJsonParser().get('previous_page_uri').getString();
    client.setPreviousUrl(previousPage);    

    //Validate url wasn't null
    if(client.hasPreviousPage()){
        //Call get Previous
        response = client.doGetPrevious();
        system.debug(response.getTwilioJsonParser().get('uri').getString());
    }
}
```
