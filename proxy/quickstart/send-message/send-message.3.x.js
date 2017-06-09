// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

const client = require('twilio')(accountSid, authToken);

client.preview.proxy
  .services("KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
  .sessions("KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
  .participants("KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
  .messageInteractions.create({
    body: "Reply to this message to chat!"
  }).then(function(response) {
    console.log(response);
  }).catch(function(err) {
    console.log(err);
  });
