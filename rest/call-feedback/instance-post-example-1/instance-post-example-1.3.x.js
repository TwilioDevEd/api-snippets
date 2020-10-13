// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

client
  .calls('CAe03b7cd806070d1f32bdb7f1046a41c0')
  .feedback()
  .create({
    qualityScore: '3',
    issue: 'imperfect-audio',
  })
  .then(feedback => console.log(feedback.dateCreated));
