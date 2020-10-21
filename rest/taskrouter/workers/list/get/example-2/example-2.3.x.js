// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
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
