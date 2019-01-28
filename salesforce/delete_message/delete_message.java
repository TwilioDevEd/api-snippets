//Delete Example
TwilioSF.TwilioApiClient client = new TwilioSF.TwilioApiClient();

client.addUrlPart('Accounts');
client.addUrlPart('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
client.addUrlPart('Messages');
client.addUrlPart('SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json');

TwilioApiClientResponse response = client.doDelete();
system.debug(response.getHtttpStatusCode());
