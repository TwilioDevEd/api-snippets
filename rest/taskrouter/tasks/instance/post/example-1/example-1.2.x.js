// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const twilio = require('twilio');

const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const taskSid = 'WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

const client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

// update a task's attributes
client.workspace.tasks(taskSid).update({
  attributes: '{"type":"support"}',
}, (err, task) => {
  console.log(task.attributes);
});

// cancel a task
client.workspace.tasks(taskSid).update({
  assignmentStatus: 'canceled',
  reason: 'waiting too long',
}, (err, task) => {
  console.log(task.assignment_status);
  console.log(task.reason);
});
