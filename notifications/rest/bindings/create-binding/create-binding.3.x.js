// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var Twilio = require('twilio');

var client = new Twilio(accountSid, authToken);
var service = client.notify.services('ISxxx');

service.bindings.create({
    endpoint: 'eyJjdHkiOiJ0d2lsaW8tZnBhO3Y9MSIsInR5cCI6IkpXVCIsImFsZyI6IkhTMjU2In0.eyJncmFudHMiOnsiY2hhdCI6eyJzZXJ2aWNlX3NpZCI6IklTNmIwZmE2MDgzOWM1MTFlNWExNTFmZWZmODE5Y2RjOWYiLCJlbmRwb2ludF9pZCI6InR3aTEtMTdjNTkyM2Y5NTBiNGJhYjllZjAwZTJlZjdkYTBkYTIifSwiaWRlbnRpdHkiOiJOb3RpZmljYXRpb25MaWJyYXJ5VW5pdFRlc3RlcjEifSwic3ViIjoiQUM3OGU4ZTY3ZmMwMjQ2NTIxNDkwZmI5OTA3ZmQwYzE2NSIsImlzcyI6IlNLMmQxYWRmOGIxYzY0YTYzM2U1ZjE4NjU5ZjdjZDE5MTEiLCJleHAiOjE0NzgyNTI4NTl9.1i256CwtacP859Xh-6cEZVio4oohxL-od9krzsa4DnY',
    identity: "00000001",
    bindingType: 'apn',
    address: '483161f7afe6f012aa5f172d3ca93f5c245e3daf34d3a911a41f41f6af3639f6',
    tag: ['premium', 'new user']
  }).then(function(binding) {
    console.log(binding);
  }).catch(function(error) {
    console.log(error);
  });
