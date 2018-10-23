// Download the helper library from https://www.twilio.com/docs/node/install
const accountSid = 'AC37be926aff21b6b5bee5e99f20fb7d6f';
const authToken = '7bab21f65f766db0fe844bf0d36ca00c';
const client = require('twilio')(accountSid, authToken);

phrases = [
    'Tell me a joke',
    'Tell me a joke',
    'I\'d like to hear a joke',
    'Do you know any good jokes?',
    'Joke',
    'Tell joke',
    'Tell me something funny',
    'Make me laugh',
    'I want to hear a joke',
    'Can I hear a joke?',
    'I like jokes',
    'I\'d like to hear a punny joke'
]

// Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list
// Replace 'UDXXX...' with the SID for the task you just created.
phrases.forEach(function(item) {
  sample = client.autopilot.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                           .tasks('tell-a-joke')
                           .samples
                           .create({
                             language: 'en-us',
                             taggedText: item,
                           })
                           .then(sample => console.log(sample.sid))
                           .done();
})
