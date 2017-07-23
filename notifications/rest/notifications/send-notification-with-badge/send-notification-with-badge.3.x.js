// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var Twilio = require('twilio');

var client = new Twilio(accountSid, authToken);

var service = client.notify.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.notifications
  .create({
    identity: '00000001',
    apn: `{"aps" :'
            '{ "alert":'
              '{"title":"Bob alert",'
               '"body" : "Bob, you just received a badge"},'
            '"badge" : 1 }}'`,
  })
  .then(notification => {
    console.log(notification);
  })
  .catch(error => console.log(error));
