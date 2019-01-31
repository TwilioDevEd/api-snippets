// Get twilio-node from twilio.com/docs/libraries/node
const client = require('twilio');

// Your Auth Token from twilio.com/console
const authToken = '12345';

// The Twilio request URL
const url = 'https://mycompany.com/myapp.php?foo=1&bar=2';

// The post variables in Twilio's request
const params = {
  CallSid: 'CA1234567890ABCDE',
  Caller: '+12349013030',
  Digits: '1234',
  From: '+12349013030',
  To: '+18005551212',
};

// The X-Twilio-Signature header attached to the request
const twilioSignature = '0/KCTR6DLpKmkAf8muzZqo1nDgQ=';

console.log(client.validateRequest(authToken, twilioSignature, url, params));
