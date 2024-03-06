// Twilio Credentials
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;

// require the Twilio module and create a REST client
const client = require('twilio')(accountSid, authToken);

client.messages
  .create({
    to: '+15558675310',
    from: '+15017122661',
    body: 'McAvoy or Stewart? These timelines can get so confusing.',
    statusCallback: 'http://requestb.in/1234abcd',
  })
  .then(message => console.log(message.sid));
