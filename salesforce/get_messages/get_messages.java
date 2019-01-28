//Get Messages No Params
TwilioSF.TwilioApiClient client = new TwilioSF.TwilioApiClient();
client.addUrlPart('Accounts');
client.addUrlPart('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
client.addUrlPart('Messages');
client.addUrlPart('.json');
TwilioSF.TwilioApiClientResponse response = client.doGet();

system.debug(response.getTwilioJsonParser().get('first_page_uri').getString());
system.debug(response.getTwilioJsonParser().get('previous_page_uri').getString());
system.debug(response.getTwilioJsonParser().get('end').getInteger());
system.debug(JSON.serializePretty(response.toMap()));
