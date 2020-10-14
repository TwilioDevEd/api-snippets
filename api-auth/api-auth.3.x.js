const twilio = require('twilio');

// To set up environmental variables, see http://twil.io/secure
const myAccountSid = process.env.TWILIO_ACCOUNT_SID; // Your Account SID from www.twilio.com/console
const apiKey = process.env.TWILIO_API_KEY; // You can generate this from www.twilio.com/console/runtime/api-keys/create
const apiSecret = process.env.TWILIO_API_SECRET; // You can generate this from www.twilio.com/console/runtime/api-keys/create

const client = twilio(apiKey, apiSecret, { accountSid: myAccountSid });

// Proof request to check credentials are working.
// Retrieving your account information
client.api.accounts.each(accounts => console.log(accounts.sid));
