// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node

const apiKeySid = "SKXXXX";
const apiKeySecret = "your_api_key_secret";
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;

const Twilio = require("twilio");

const client = new Twilio(API_KEY_SID, API_KEY_SECRET, {
  accountSid: ACCOUNT_SID,
});

const compositionSid = "CJXXXX";
const uri =
  "https://video.twilio.com/v1/Compositions/" +
  compositionSid +
  "/Media?Ttl=3600";

client
  .request({
    method: "GET",
    uri: uri,
  })
  .then((response) => {
    // For example, download the media to a local file
    const file = fs.createWriteStream("myFile.mp4");
    const r = request(response.data.redirect_to);
    r.on("response", (res) => {
      res.pipe(file);
    });
  })
  .catch((error) => {
    console.log("Error fetching /Media resource " + error);
  });
