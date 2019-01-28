//Get Messages with Params
TwilioSF.TwilioApiClient client = new TwilioSF.TwilioApiClient();
client.addUrlPart('Accounts');
client.addUrlPart('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
client.addUrlPart('Messages');
client.addUrlPart('.json');

client.addParam('To','+15558675310');
client.addParam('PageSize','5');
client.addParam('DateSent','2018-06-01','>=');
TwilioSF.TwilioApiClientResponse response = client.doGet();

system.debug(response.getTwilioJsonParser().get('previous_page_uri').getString());
system.debug(response.getTwilioJsonParser().get('page_size').getInteger());
system.debug(JSON.serializePretty(response.toMap()));

String messagesString = response.getTwilioJsonParser().get('messages').getString();
List<TwilioJsonParser> messagesArray = response.getTwilioArrayJsonParser(messagesString);
for(TwilioJsonParser p:messagesArray){
   system.debug(p.get('sid').getString());
}
