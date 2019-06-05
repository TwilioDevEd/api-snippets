// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node

// Find your credentials at twilio.com/console
const API_KEY_SID = 'SKXXXX';
const API_KEY_SECRET = 'your_api_key_secret';
const ACCOUNT_SID = 'ACXXXX';

const Twilio = require('twilio');

const client = new Twilio(API_KEY_SID, API_KEY_SECRET, {accountSid: ACCOUNT_SID});

client.video.rooms('RMXXXX').participants.get('PAXXXX')
.subscribeRules.fetch()
.then(subscribeRules => {
  subscribeRules.rules.forEach(rule => {
    console.log('Read rule with type = ' + rule.type);
  });
})
.catch(error => {
  console.log('Error fetching subscribed rules ' + error)
});
