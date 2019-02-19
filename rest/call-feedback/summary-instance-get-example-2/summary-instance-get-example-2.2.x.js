// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.calls
  .feedbackSummary('FSa346467ca321c71dbd5e12f627deb854')
  .get((err, summary) => {
    console.log(summary.dateCreated);
  });
