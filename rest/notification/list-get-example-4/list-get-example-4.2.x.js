// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.notifications.list(
  {
    'messageDate>': '2009-07-06',
    'messageDate<': '2009-07-08',
    log: '1',
  },
  (err, data) => {
    data.notifications.forEach(notification => {
      console.log(notification.RequestUrl);
    });
  }
);
