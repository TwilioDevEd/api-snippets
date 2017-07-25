// Download the Node helper library from twilio.com/docs/node/install
// These are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

const client = require('twilio')(accountSid, authToken);

client.monitor.v1.events
  .list({
    sourceIpAddress: '104.14.155.29',
    startDate: '2015-04-25T00:00:00Z',
    endDate: '2015-04-25T23:59:59Z',
  })
  .then(response => console.log(response));
