// Download the helper library from https://www.twilio.com/docs/node/install
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

phrases = [
    'hello',
    'hi',
    'Hello',
    'Hi there'
]

// Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list
phrases.forEach(function(item) {
  sample = client.autopilot.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                           .tasks('hello-world')
                           .samples
                           .create({
                             language: 'en-us',
                             taggedText: item,
                           })
                           .then(sample => console.log(sample.sid))
                           .done();
})
