// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

const client = require('twilio')(accountSid, authToken);

client.preview
  .proxy
  .services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .participants
  .create({
    identifier: '+15558675309',
    friendly_name: 'Alice'
  })
  .then(function(response) {
    console.log(response);
  }).catch(function(err) {
    console.log(err);
  });
