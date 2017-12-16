// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const twilio = require('twilio');

const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

const client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

client.workspace.workers.get({ Available: '1' }, (err, data) => {
  if (!err) {
    data.workers.forEach(worker => {
      console.log(worker.friendly_name);
    });
  }
});

client.workspace.workers.get(
  { TaskQueueSid: 'WQf855e98ad280d0a0a325628e24ca9627', Available: '1' },
  (err, data) => {
    if (!err) {
      data.workers.forEach(worker => {
        console.log(worker.friendly_name);
      });
    }
  }
);

client.workspace.workers.get(
  { TargetWorkersExpression: "type == 'leads'" },
  (err, data) => {
    if (!err) {
      data.workers.forEach(worker => {
        console.log(worker.friendly_name);
      });
    }
  }
);
