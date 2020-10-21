// Find your Account Sid at https://www.twilio.com/console/account/settings
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
// Create an API Key and Secret at https://www.twilio.com/console/chat/dev-tools/api-keys
const apiKey = process.env.TWILIO_API_KEY;
const apiSecret = process.env.TWILIO_API_SECRET;
// Your Chat Service SID from https://www.twilio.com/console/chat/services
const serviceSid = process.env.TWILIO_CHAT_SERVICE_SID;
const Twilio = require('twilio').Twilio;
// Authenticate with Twilio
const client = new Twilio(apiKey, apiSecret, { accountSid: accountSid });
const service = client.chat.services(serviceSid);

// Update the service webhooks
const notifications = {
  newMessage: {
    enabled: true,
    template: 'A New message in ${CHANNEL} from ${USER}: ${MESSAGE}',
    sound: 'default',
  },
};
service
  .update(notifications)
  .then(response => {
    console.log(response);
  })
  .catch(error => {
    console.log(error);
  });
