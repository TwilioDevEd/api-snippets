// Download the helper library from https://www.twilio.com/docs/node/install

// Your Account Sid and Auth Token from twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
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
