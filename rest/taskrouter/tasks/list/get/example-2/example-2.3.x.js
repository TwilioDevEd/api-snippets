// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const client = require('twilio')(accountSid, authToken);

client.taskrouter.v1
  .workspaces(workspaceSid)
  .tasks
  .list({'TaskQueueSid': 'WQf855e98ad280d0a0a325628e24ca9627'})
  .then((tasks) => {
    tasks.forEach((task) => console.log(task.attributes));
  });

client.taskrouter.v1
  .workspaces(workspaceSid)
  .tasks
  .list({'AssignmentStatus': 'pending'})
  .then((tasks) => {
    tasks.forEach((task) => console.log(task.attributes));
  });
