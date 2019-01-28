TwilioSF.TwilioApiClient client = new TwilioSF.TwilioApiClient();
client.setBaseUrl('https://messaging.twilio.com/');
client.setApiVersion('v1');
client.addUrlPart('Services');
client.addUrlPart('MGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

client.addParam('FriendlyName','Dev Org1');
TwilioSF.TwilioApiClientResponse response = client.doPost();

system.debug(response.getTwilioJsonParser().get('friendly_name').getString());
system.debug(response.getTwilioJsonParser().get('area_code_geomatch').getBoolean());
system.debug(response.getTwilioJsonParser().get('links').get('phone_numbers').getString());
system.debug(JSON.serializePretty(response.toMap()));
