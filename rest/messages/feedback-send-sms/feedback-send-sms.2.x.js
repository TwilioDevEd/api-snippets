// Twilio Credentials
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';

// require the Twilio module and create a REST client
let client = require('twilio')(accountSid, authToken);

// Generate a random, unique code
let uniqueCode = '1234567890';

client.messages.create(
  {
    to: '+15558675309',
    from: '+15017250604',
    body: 'Open to confirm: http://yourserver.com/confirm?id=' + uniqueCode,
    provideFeedback: true,
  },
  function(err, message) {
    console.log('We should save this to a database:');
    console.log('Unique Code = ' + uniqueCode);
    console.log('Message SID = ' + message.sid);
  }
);
