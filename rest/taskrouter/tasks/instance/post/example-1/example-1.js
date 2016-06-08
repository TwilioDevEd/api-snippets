// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var twilio = require('twilio');

var accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
var authToken = "{{ auth_token }}";
var workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
var taskSid = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

var client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

// update a task's attributes
client.workspace.tasks(taskSid).update({
    attributes: '{"type":"support"}'
}, function(err, task) {
    console.log(task.attributes);
});

// cancel a task
client.workspace.tasks(taskSid).update({
    assignmentStatus: 'canceled',
    reason: 'waiting too long'
}, function(err, task) {
    console.log(task.assignment_status);
    console.log(task.reason);
});