// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node

// To set up environmental variables, see http://twil.io/secure
const apiKeySid = process.env.TWILIO_API_KEY;
const apiKeySecret = process.env.TWILIO_API_KEY_SECRET;
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
    const r = request(response.body.redirect_to);
    r.on("response", (res) => {
      res.pipe(file);
    });
  })
  .catch((error) => {
    console.log("Error fetching /Media resource " + error);
  });
