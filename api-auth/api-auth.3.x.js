const twilio = require('twilio');

const myAccountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; // Your Account SID from www.twilio.com/console
const apiKey = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; // You can generate this from www.twilio.com/console/runtime/api-keys/create
const apiSecret = 'your_api_secret'; // You can generate this from www.twilio.com/console/runtime/api-keys/create

// DANGER! This is insecure. See http://twil.io/secure
const client = twilio(apiKey, apiSecret, { accountSid: myAccountSid });

// Proof request to check credentials are working.
// Retrieving your account information
client.api.accounts.each(accounts => console.log(accounts.sid));
