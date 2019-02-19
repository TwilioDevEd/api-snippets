// Twilio Credentials
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

// require the Twilio module and create a REST client
const client = require('twilio')(accountSid, authToken);

// Generate a random, unique code
const uniqueCode = '1234567890';

client.messages.create(
  {
    to: '+15558675310',
    from: '+15017122661',
    body: 'Open to confirm: http://yourserver.com/confirm?id=' + uniqueCode,
    provideFeedback: true,
  },
  (err, message) => {
    console.log('We should save this to a database:');
    console.log('Unique Code = ' + uniqueCode);
    console.log('Message SID = ' + message.sid);
  }
);
