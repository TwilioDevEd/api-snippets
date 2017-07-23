// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let Twilio = require('twilio');

let client = new Twilio(accountSid, authToken);

let service = client.notify.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.bindings
  .list({
    // filter bindings with the following attributes
    startDate: new Date('2015-08-18'),
    tag: 'new user',
  })
  .then(function(bindings) {
    bindings.forEach(binding => console.log(binding.identity));
  })
  .catch(function(error) {
    console.log(error);
  })
  .done();
