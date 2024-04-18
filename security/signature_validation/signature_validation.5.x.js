// Get twilio-node from twilio.com/docs/libraries/node
const client = require('twilio');

// Your Auth Token from twilio.com/console
const authToken = process.env.TWILIO_AUTH_TOKEN;

// Store Twilio's request URL (the url of your webhook) as a variable
const url = 'https://mycompany.com/myapp';

// Store the application/x-www-form-urlencoded parameters from Twilio's request as a variable
// In practice, this MUST include all received parameters, not a
// hardcoded list of parameters that you receive today. New parameters
// may be added without notice.
const params = {
  CallSid: 'CA1234567890ABCDE',
  Caller: '+12349013030',
  Digits: '1234',
  From: '+12349013030',
  To: '+18005551212',
};

// Store the X-Twilio-Signature header attached to the request as a variable
const twilioSignature = 'Np1nax6uFoY6qpfT5l9jWwJeit0=';

// Check if the incoming signature is valid for your application URL and the incoming parameters
console.log(client.validateRequest(authToken, twilioSignature, url, params));
