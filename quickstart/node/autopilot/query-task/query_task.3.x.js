// Download the helper library https://www.twilio.com/docs/libraries/node#install

// Your Account Sid and Auth Token from twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

// Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list
query = client.autopilot.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                                 .queries
                                 .create({
                                   language: 'en-US',
                                   query: 'Tell me a joke',
                                 })
                                 .then(query => console.log(query.results.task))
                                 .done();
