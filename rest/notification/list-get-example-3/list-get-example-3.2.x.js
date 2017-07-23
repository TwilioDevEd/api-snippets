// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client.notifications.list(
  {
    'messageDate>': '2009-07-06',
    log: '1',
  },
  function(err, data) {
    data.notifications.forEach(function(notification) {
      console.log(notification.RequestUrl);
    });
  }
);
