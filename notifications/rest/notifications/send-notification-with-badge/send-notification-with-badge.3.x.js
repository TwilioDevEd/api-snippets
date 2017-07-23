// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let Twilio = require('twilio');

let client = new Twilio(accountSid, authToken);

let service = client.notify.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

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
