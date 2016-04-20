// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var twilio = require('twilio');

var accountSid = "{{ account_sid }}";
var authToken = "{{ auth_token }}";
var workspaceSid = "{{ workspace_sid }}";
var workflowSid = "{{ workflow_sid }}";

var client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

client.workspace.workflows(workflowSid).statistics.get({}, function(err, responseData) {
    if(!err) {
        console.log(responseData.cumulative.avg_task_acceptance_time);
        console.log(responseData.cumulative.tasks_created);
        console.log(responseData.realtime.tasks_by_status.pending);
        console.log(responseData.realtime.tasks_by_status.assigned);
    }
});