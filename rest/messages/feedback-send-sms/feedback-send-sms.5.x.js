// Twilio Credentials
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;

// require the Twilio module and create a REST client
const client = require('twilio')(accountSid, authToken);

// Generate a random, unique code
const uniqueCode = '1234567890';

client.messages
  .create({
    to: '+15558675310',
    from: '+15017122661',
    body: `Open to confirm: http://yourserver.com/confirm?id=${uniqueCode}`,
    provideFeedback: 'true',
  })
  .then(message => {
    console.log('We should save this to a database:');
    console.log(`Unique Code = ${uniqueCode}`);
    console.log(`Message SID = ${message.sid}`);
  });
