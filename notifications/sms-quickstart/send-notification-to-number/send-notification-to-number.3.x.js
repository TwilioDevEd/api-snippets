// Download the Node helper library from www.twilio.com/docs/libraries/node#installation
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

const notificationOpts = {
  toBinding: JSON.stringify({
    binding_type: 'sms',
    address: '+1651000000000',
  }),
  body: 'Knock-Knock! This is your first Notify SMS',
};

client.notify
  .services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .notifications.create(notificationOpts)
  .then(notification => console.log(notification.sid))
  .catch(error => console.log(error));
