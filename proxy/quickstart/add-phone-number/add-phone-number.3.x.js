// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

const client = require('twilio')(accountSid, authToken);

client.preview.proxy
  .services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .phoneNumbers.create({ sid: 'PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' })
  .then(response => {
    console.log(response);
  })
  .catch(err => {
    console.log(err);
  });
