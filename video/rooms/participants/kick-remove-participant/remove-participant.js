// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
var apiKeySid = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var apiKeySecret = 'your_api_key_secret';
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var Twilio = require('twilio');

var client = new Twilio(apiKeySid, apiKeySecret, {accountSid: accountSid});

client.video.rooms('RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').participants.get('Alice').fetch()
  .then(participant => {
    console.log(participant.duration);
  });
