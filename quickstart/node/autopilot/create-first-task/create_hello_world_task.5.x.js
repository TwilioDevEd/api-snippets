// Download the helper library from https://www.twilio.com/docs/node/install

// Your Account Sid and Auth Token from twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

// Build task actions that say something and listens for a repsonse.
helloWorldTaskActions = {
  actions: [
    { say: 'Hi there, I\'m your virtual assistant! How can I help you?' },
    { listen: true }
  ]
};

// Create the hello_world task
// Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list
client.autopilot.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                .tasks
                .create({
                  uniqueName: 'hello-world',
                  actions: helloWorldTaskActions,
                })
                .then(assistant => console.log(assistant.sid))
                .done();
