// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client.queues('QU5ef8732a3c49700934481addd5ce1659').members('Front').update({
  url: 'http://demo.twilio.com/docs/voice.xml',
  method: 'POST',
}, function(err, member) {
  console.log(member.waitTime);
});
