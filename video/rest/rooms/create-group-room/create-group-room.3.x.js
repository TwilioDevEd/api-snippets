// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
var apiKeySid = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var apiKeySecret = 'your_api_key_secret';
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var Twilio = require('twilio');

var client = new Twilio(apiKeySid, apiKeySecret, {accountSid: accountSid});

client.video.rooms.create({
    uniqueName: 'DailyStandup',
    type: 'group',
    recordParticipantsOnConnect: 'true',
    statusCallback: 'http://example.org'
  }).then((room) => {
    console.log(room.sid);
  });
