// Download the helper library https://www.twilio.com/docs/libraries/node#install

// Your Account Sid and Auth Token from twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
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
