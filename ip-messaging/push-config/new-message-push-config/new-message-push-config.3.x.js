// Find your Account Sid at https://www.twilio.com/console/account/settings
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
// Create an API Key and Secret at https://www.twilio.com/console/chat/dev-tools/api-keys
const apiKey = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const apiSecret = 'your_api_secret';
// Your Chat Service SID from https://www.twilio.com/console/chat/services
const serviceSid = 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
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
