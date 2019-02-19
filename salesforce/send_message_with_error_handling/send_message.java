//Put Example with failures
TwilioSF__TwilioApiClient client = new TwilioSF__TwilioApiClient();
//Switch for throwing exceptions,=.
//client.setThrowExceptionsOnFailedResponses();
client.addUrlPart('Accounts');
client.addUrlPart('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
client.addUrlPart('Messages.json');

client.addParam('To','+15017122661');
client.addParam('From','+15558675310');
client.addParam('Body','Here is my message');


TwilioSF__TwilioApiClientResponse response = client.doPut();
system.debug(response.hasError());
system.debug(response.getErrorMessage());
