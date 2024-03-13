// Download the Node helper library from twilio.com/docs/node/install
// These are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;

const client = require('twilio')(accountSid, authToken);

client.monitor.v1.events
  .list({
    sourceIpAddress: '104.14.155.29',
    startDate: '2015-04-25T00:00:00Z',
    endDate: '2015-04-25T23:59:59Z',
  })
  .then(response => console.log(response));
