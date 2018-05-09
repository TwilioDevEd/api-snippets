// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node

const apiKeySid = 'SKXXXX';
const apiKeySecret = 'your_api_key_secret';
const accountSid = 'ACXXXX';

const Twilio = require('twilio');
const request = require('request');

const client = new Twilio(API_KEY_SID, API_KEY_SECRET, {accountSid: ACCOUNT_SID});

const compositionSid = 'CJXXXX';
const uri ='https://video.twilio.com/v1/Compositions/' + compositionSid + '/Media?Ttl=6000';

client.request({
  method: 'GET',
  uri: uri
})
  .then(response =>{
    const mediaLocation = JSON.parse(response.body).redirect_to;
    request.get(mediaLocation, (err, res, media)=>{
      if(err){
        console.log(err)
      } else {
        //Variable 'media' contains the binary Composition Media Data
        console.log('Media loaded successfully');
      }
    });
  });
