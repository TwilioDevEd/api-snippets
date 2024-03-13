// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node

// Find your credentials at twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const API_KEY_SID = process.env.TWILIO_API_KEY;
const API_KEY_SECRET = process.env.TWILIO_API_KEY_SECRET;
const ACCOUNT_SID = process.env.TWILIO_ACCOUNT_SID;

const Twilio = require('twilio');

const client = new Twilio(API_KEY_SID, API_KEY_SECRET, {accountSid: ACCOUNT_SID});

client.video.rooms('RMXXXX').participants.get('Customer')
.subscribeRules.update({
  rules: [
    {"type": "include", "all": true},
    {"type": "exclude", "publisher": "Supervisor"}
  ]
})
.then(result => {
  console.log('Subscribe Rules updated successfully')
})
.catch(error => {
  console.log('Error updating rules ' + error)
});
