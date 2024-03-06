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

//-------------------------------------------------------------------------------
//1. At connect time Adam wants to receive all the tracks.
//   Done by default rule. No further actions required.


//-------------------------------------------------------------------------------
//2. After a while, Adam notices his bandwidth consumption is too high and
//   decides to unsubscribe from all video tracks

client.video.rooms('RMXXXX').participants.get('Adam')
.subscribeRules.update({
  rules: [
    {"type": "include", "kind": "audio"}
  ]
})
.then(result => {
  console.log('Subscribe Rules updated successfully')
})
.catch(error => {
  console.log('Error updating rules ' + error)
});

//-------------------------------------------------------------------------------
//3. Later, a video screenshare track with SID MTXXXX is published to the room
//   and Adam subscribes to it.

client.video.rooms('RMXXXX').participants.get('Adam')
.subscribeRules.update({
  rules: [
    {"type": "include", "kind": "audio"},
    {"type": "include", "track": "MTXXXX"}
  ]
})
.then(result => {
  console.log('Subscribe Rules updated successfully')
})
.catch(error => {
  console.log('Error updating rules ' + error)
});

//-------------------------------------------------------------------------------
//4. John, another participant, is in a noisy place and his audio track is
//   annoying. Adam decides to unsubscribe from it.

client.video.rooms('RMXXXX').participants.get('Adam')
.subscribeRules.update({
  rules: [
    {"type": "include", "kind": "audio"},
    {"type": "include", "track": "MTXXXX"},
    {"type": "exclude", "publisher": "John", "kind": "audio"}
  ]
})
.then(result => {
  console.log('Subscribe Rules updated successfully')
})
.catch(error => {
  console.log('Error updating rules ' + error)
});
