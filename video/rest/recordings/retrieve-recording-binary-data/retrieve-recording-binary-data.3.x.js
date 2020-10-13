// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
const Twilio = require("twilio");

const apiKeySid = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
const apiKeySecret = "your_api_key_secret";
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const client = new Twilio(apiKeySid, apiKeySecret, { accountSid: accountSid });

const recordingSid = "RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
const uri = `https://video.twilio.com/v1/Recordings/${recordingSid}/Media`;
client.request({ method: "GET", uri: uri }).then(response => {
  const mediaLocation = response.data.redirect_to;
  request.get(mediaLocation, (err, res, media) => {
    console.log(media);
  });
});
