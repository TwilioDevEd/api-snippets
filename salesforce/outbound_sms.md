```
//Post Example
TwilioApiClient api = new TwilioApiClient();
api.addUrlPart('Accounts');
api.addUrlPart('AC91c6dc4cca313b7a23b1b36b4a37e89c');
api.addUrlPart('Messages.json');

api.addParam('To','7152520504');
api.addParam('From','7159727069');
api.addParam('Body','Here is my message');
TwilioApiClientResponse response = api.doPost();

//Example with key value pairs
String sid = response.getTwilioJsonParser().get('sid').getString();
Integer totalSegments = response.getTwilioJsonParser().get('num_segments').getInteger();

//Example a key with object
String media = response.getTwilioJsonParser().get('subresource_uris').get('media').getString();
```
