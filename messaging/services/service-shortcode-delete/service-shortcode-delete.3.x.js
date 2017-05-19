// Download the Node helper library from twilio.com/docs/libraries/node
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

const client = require('twilio')(accountSid, authToken);
const service = client.messaging.services('MG2172dd2db502e20dd981ef0d67850e1a');

service.shortCodes('SC3f94c94562ac88dccf16f8859a1a8b25')
       .remove()
       .then(function(response) {
          console.log(response);
       }).catch(function(error) {
         console.log(error);
       });
