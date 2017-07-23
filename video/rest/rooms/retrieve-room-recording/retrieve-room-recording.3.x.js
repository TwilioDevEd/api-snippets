// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
let apiKeySid = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let apiKeySecret = 'your_api_key_secret';
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let Twilio = require('twilio');

let client = new Twilio(apiKeySid, apiKeySecret, { accountSid: accountSid });

client.video
  .rooms('RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .recordings('RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .fetch()
  .then(recording => {
    console.log(recording.type);
  });
