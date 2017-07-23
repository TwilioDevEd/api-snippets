// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = require('twilio')(accountSid, authToken);

client.calls('CAe03b7cd806070d1f32bdb7f1046a41c0').feedback.create({
  quality_score: '3',
  issue: 'imperfect-audio',
}, function(err, feedback) {
  console.log(feedback.dateCreated);
});
