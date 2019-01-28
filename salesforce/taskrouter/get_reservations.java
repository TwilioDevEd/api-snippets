//Task Router Get Reservations
TwilioSF.TwilioApiClient client = new TwilioSF.TwilioApiClient();
client.setBaseUrl('https://taskrouter.twilio.com/');
client.setApiVersion('v1');
client.addUrlPart('Workspaces');
client.addUrlPart('WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
client.addUrlPart('Workers');
client.addUrlPart('WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
client.addUrlPart('Reservations');

TwilioSF.TwilioApiClientResponse response = client.doGet();
system.debug(response.getTwilioJsonParser().get('meta').get('first_page_url').getString());
system.debug(JSON.serializePretty(response.toMap()));
String messagesString = response.getTwilioJsonParser().get('reservations').getString();
List<TwilioJsonParser> messagesArray = response.getTwilioArrayJsonParser(messagesString);
for(TwilioJsonParser p:messagesArray){
   system.debug(p.get('worker_sid').getString());
   system.debug(p.get('date_updated').getDatetime());
   system.debug(p.get('links').get('task').getString());
}
