// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let Twilio = require('twilio');

let client = new Twilio(accountSid, authToken);

client.notify
  .services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .remove()
  .then(function(wasRemoved) {
    if (wasRemoved) {
      console.log(
        'notify service "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" was removed'
      );
    }
  })
  .catch(function(error) {
    console.log(error);
  })
  .done();
