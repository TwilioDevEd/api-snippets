// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let twilio = require('twilio');

let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let workflowSid = 'WWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

let client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

client.workspace
  .workflows(workflowSid)
  .statistics.get({}, function(err, responseData) {
    if (!err) {
      console.log(responseData.cumulative.avg_task_acceptance_time);
      console.log(responseData.cumulative.tasks_created);
      console.log(responseData.realtime.tasks_by_status.pending);
      console.log(responseData.realtime.tasks_by_status.assigned);
    }
  });
