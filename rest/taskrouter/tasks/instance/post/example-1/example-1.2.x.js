// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let twilio = require('twilio');

let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let taskSid = 'WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

let client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

// update a task's attributes
client.workspace.tasks(taskSid).update({
  attributes: '{"type":"support"}',
}, function(err, task) {
  console.log(task.attributes);
});

// cancel a task
client.workspace.tasks(taskSid).update({
  assignmentStatus: 'canceled',
  reason: 'waiting too long',
}, function(err, task) {
  console.log(task.assignment_status);
  console.log(task.reason);
});
