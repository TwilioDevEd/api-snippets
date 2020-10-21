// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

const filterOpts = {
  messageDateAfter: '2016-07-06',
  messageDateBefore: '2016-07-08',
  log: '1',
};

client.notifications.each(filterOpts, notification =>
  console.log(notification.requestUrl)
);
