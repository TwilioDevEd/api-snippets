// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.calls.feedbackSummary.create(
  {
    startDate: '2014-06-01',
    endDate: '2014-06-30',
    includeSubaccounts: true,
    statusCallback: 'http://www.example.com/feedback',
  },
  (err, summary) => {
    console.log(summary.sid);
  }
);
