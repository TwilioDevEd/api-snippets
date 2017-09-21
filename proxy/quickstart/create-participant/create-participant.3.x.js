// Get the Node helper library from https://twilio.com/docs/libraries/node
// Get your Account SID and Auth Token from https://twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

const client = require('twilio')(accountSid, authToken);

client.proxy
  .services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .participants.create({
    identifier: '+15558675309',
    friendly_name: 'Alice',
  })
  .then(response => {
    console.log(response);
  })
  .catch(err => {
    console.log(err);
  });
