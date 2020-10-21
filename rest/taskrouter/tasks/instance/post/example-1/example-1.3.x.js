// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const taskSid = 'WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const client = require('twilio')(accountSid, authToken);

// update a task's attributes
client.taskrouter.v1
  .workspaces(workspaceSid)
  .tasks(taskSid)
  .update({
    attributes: '{"type":"support"}',
  })
  .then(task => console.log(task.attributes));

// cancel a task
client.taskrouter.v1
  .workspaces(workspaceSid)
  .tasks(taskSid)
  .update({
    assignmentStatus: 'canceled',
    reason: 'waiting too long',
  })
  .then(task => {
    console.log(task.assignmentStatus);
    console.log(task.reason);
  });
