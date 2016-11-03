// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

const filterOpts = {
  status: 'in-progress',
  startTimeAfter: '2016-07-04',
  startTimeBefore: '2016-07-06',
};

client.calls
  .each(filterOpts, (call) => console.log(call.direction));
