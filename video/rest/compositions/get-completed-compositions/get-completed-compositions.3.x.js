// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node

const apiKeySid = 'SKXXXX';
const apiKeySecret = 'your_api_key_secret';
const accountSid = 'ACXXXX';
const Twilio = require('twilio');

const client = new Twilio(apiKeySid, apiKeySecret, {accountSid: accountSid});

client.video.compositions.
  list({
    status: 'completed'
  })
  .then(compositions =>{
    console.log("Found " + compositions.length + " compositions.");
    compositions.forEach(function(composition){
      console.log('Read compositionSid=' + composition.sid);
    });
  });
