//Post Example
TwilioSF.TwilioApiClient api = new TwilioSF.TwilioApiClient();
api.addUrlPart('Accounts');
api.addUrlPart('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
api.addUrlPart('Messages.json');

api.addParam('To','+15558675310');
api.addParam('From','+15017122661');
api.addParam('Body','Here is my message');
TwilioSF.TwilioApiClientResponse response = api.doPost();

//Example with key value pairs
String sid = response.getTwilioJsonParser().get('sid').getString();
Integer totalSegments = response.getTwilioJsonParser().get('num_segments').getInteger();

//Example a key with object
String media = response.getTwilioJsonParser().get('subresource_uris').get('media').getString();
