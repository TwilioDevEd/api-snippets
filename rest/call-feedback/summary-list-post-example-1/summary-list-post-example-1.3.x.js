// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.calls.feedbackSummaries.create({
    startDate: '2014-06-01',
    endDate: '2014-06-30',
    includeSubaccounts: 'true',
    statusCallback: 'http://www.example.com/feedback',
})
.then((summary) => console.log(summary.sid));
