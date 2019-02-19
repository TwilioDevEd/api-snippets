// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const twilio = require('twilio');

const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

const client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

client.workspace.tasks.get(
  { TaskQueueSid: 'WQf855e98ad280d0a0a325628e24ca9627' },
  (err, data) => {
    if (!err) {
      data.tasks.forEach(task => {
        console.log(task.attributes);
      });
    }
  }
);

client.workspace.tasks.get({ AssignmentStatus: 'pending' }, (err, data) => {
  if (!err) {
    data.tasks.forEach(task => {
      console.log(task.attributes);
    });
  }
});
