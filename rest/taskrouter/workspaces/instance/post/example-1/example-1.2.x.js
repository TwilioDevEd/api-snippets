// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const twilio = require('twilio');

const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

const client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

client.workspace.update(
  {
    friendlyName: 'NewFriendlyName',
    eventCallbackUrl: 'http://requestb.in/vh9reovh',
  },
  (err, workspace) => {
    console.log(workspace.friendly_name);
  }
);
