// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const client = require('twilio')(accountSid, authToken);

client.taskrouter.v1
  .workspaces(workspaceSid)
  .tasks.list({ TaskQueueSid: 'WQf855e98ad280d0a0a325628e24ca9627' })
  .then(tasks => {
    tasks.forEach(task => console.log(task.attributes));
  });

client.taskrouter.v1
  .workspaces(workspaceSid)
  .tasks.list({ AssignmentStatus: 'pending' })
  .then(tasks => {
    tasks.forEach(task => console.log(task.attributes));
  });
