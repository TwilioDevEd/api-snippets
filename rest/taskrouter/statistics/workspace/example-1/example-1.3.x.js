// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const client = require('twilio')(accountSid, authToken);

client.taskrouter.v1
  .workspaces(workspaceSid)
  .statistics()
  .fetch()
  .then(responseData => {
    console.log(responseData.cumulative.avg_task_acceptance_time);
    console.log(responseData.cumulative.tasks_created);
    console.log(responseData.realtime.tasks_by_status.pending);
    console.log(responseData.realtime.tasks_by_status.assigned);
  });
