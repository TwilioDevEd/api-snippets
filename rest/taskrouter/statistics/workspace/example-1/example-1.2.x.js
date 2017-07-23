// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var twilio = require('twilio');

var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var taskQueueSid = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

var client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

client.workspace.statistics.get({}, function(err, responseData) {
  if (!err) {
    console.log(responseData.cumulative.avg_task_acceptance_time);
    console.log(responseData.cumulative.tasks_created);
    console.log(responseData.realtime.tasks_by_status.pending);
    console.log(responseData.realtime.tasks_by_status.assigned);
  }
});
