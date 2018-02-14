// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node

const apiKeySid = 'SKXXXX';
const apiKeySecret = 'your_api_key_secret';
const accountSid = 'ACXXXX';
const Twilio = require('twilio');

const client = new Twilio(apiKeySid, apiKeySecret, {accountSid: accountSid});

client.video.compositions.
  create({
    videoSources: 'PAXXXX',
    audioSources: 'RMXXXX',
    videoLayout: 'GRID',
    statusCallback: 'http://my.server.org/callbacks',
    resolution: '1920x1080',
    format: 'mp4'
  })
  .then(composition =>{
    console.log('Created Composition with SID=' + composition.sid);
  });
