// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

const filterOpts = {
  category: 'calls-inbound',
  startDate: '2012-09-01',
  endDate: '2012-09-30',
};

client.usage.records.each(filterOpts, record => console.log(record.price));
