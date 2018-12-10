//Put Example with failures
TwilioApiClient client = new TwilioApiClient();
//Switch for throwing exceptions,=.
//client.setThrowExceptionsOnFailedResponses();
client.addUrlPart('Accounts');
client.addUrlPart('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
client.addUrlPart('Messages.json');

client.addParam('To','+15017122661');
client.addParam('From','+15558675310');
client.addParam('Body','Here is my message');


TwilioApiClientResponse response = client.doPut();
system.debug(response.hasError());
system.debug(response.getErrorMessage());
