// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.usage.records.list(
  {
    category: 'calls-inbound',
    startDate: '2012-09-01',
    endDate: '2012-09-30',
  },
  (err, data) => {
    data.usageRecords.forEach(record => {
      console.log(record.price);
    });
  }
);
