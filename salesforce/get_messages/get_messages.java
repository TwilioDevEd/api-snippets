//Get Messages No Params
TwilioApiClient client = new TwilioApiClient();
client.addUrlPart('Accounts');
client.addUrlPart('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
client.addUrlPart('Messages');
client.addUrlPart('.json');
TwilioApiClientResponse response = client.doGet();

system.debug(response.getTwilioJsonParser().get('first_page_uri').getString());
system.debug(response.getTwilioJsonParser().get('previous_page_uri').getString());
system.debug(response.getTwilioJsonParser().get('end').getInteger());
system.debug(JSON.serializePretty(response.toMap()));
