// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const client = require('twilio')(accountSid, authToken);

client.taskrouter.v1
  .workspaces(workspaceSid)
  .workers.list({ Available: '1' })
  .then(workers => {
    workers.forEach(worker => console.log(worker.friendlyName));
  });

client.taskrouter.v1
  .workspaces(workspaceSid)
  .workers.list({
    TaskQueueSid: 'WQf855e98ad280d0a0a325628e24ca9627',
    Available: '1',
  })
  .then(workers => {
    workers.forEach(worker => console.log(worker.friendlyName));
  });

client.taskrouter.v1
  .workspaces(workspaceSid)
  .workers.list({ TargetWorkersExpression: 'type == "leads"' })
  .then(workers => {
    workers.forEach(worker => console.log(worker.friendlyName));
  });
