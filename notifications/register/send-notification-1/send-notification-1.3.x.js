// Download the Node helper library from www.twilio.com/docs/libraries/node#installation
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

const notificationOpts = {
  Tags: 'new_user',
  Body: 'Hello New Users',
};

client.notify.v1
  .services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .notifications.create(notificationOpts)
  .then(notification => console.log(notification.sid))
  .catch(error => console.log(error));
