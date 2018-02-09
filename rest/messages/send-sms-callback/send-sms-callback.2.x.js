// Twilio Credentials
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

// require the Twilio module and create a REST client
const client = require('twilio')(accountSid, authToken);

client.messages.create(
  {
    to: '+15558675310',
    from: '+15017122661',
    body: 'McAvoy or Stewart? These timelines can get so confusing.',
    statusCallback: 'http://requestb.in/1234abcd',
  },
  (err, message) => {
    console.log(message.sid);
  }
);
