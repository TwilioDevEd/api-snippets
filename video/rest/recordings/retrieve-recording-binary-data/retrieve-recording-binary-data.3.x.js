// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
const Twilio = require("twilio");

// To set up environmental variables, see http://twil.io/secure
const apiKeySid = process.env.TWILIO_API_KEY;
const apiKeySecret = process.env.TWILIO_API_KEY_SECRET;
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
