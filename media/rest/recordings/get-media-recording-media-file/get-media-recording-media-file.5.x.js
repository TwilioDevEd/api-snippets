const fs = require('fs');
const request = require('request');

// Download the helper library from https://www.twilio.com/docs/node/install
// Find your Account SID and Auth Token at twilio.com/console
// and set the environment variables. See http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

const recordingSid = "KVXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
const uri =
  "https://media.twilio.com/v1/MediaRecordings/" +
    recordingSid +
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
