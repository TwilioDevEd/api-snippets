// Download the Node helper library from twilio.com/docs/libraries/node
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

const client = require('twilio')(accountSid, authToken);

client.messaging.services.list()
      .then(function(response) {
        console.log(response);
      }).catch(function(error) {
        console.log(error);
      });
