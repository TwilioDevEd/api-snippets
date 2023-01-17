// Download the helper library from https://www.twilio.com/docs/node/install

// Your Account Sid and Auth Token from twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

// Provide actions for the new task
jokeActions = {
  actions: [
    { say: 'I was going to look for my missing watch, but I could never find the time.' }
  ]
}

// Create a new task named 'tell_a_joke'
// Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list
task = client.autopilot.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                       .tasks
                       .create({
                         uniqueName: 'tell-a-joke',
                         actions: jokeActions,
                       })
                       .then(task => console.log(task.sid))
                       .done();
