// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let twilio = require('twilio');

let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

let client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

client.workspace.update(
  {
    friendlyName: 'NewFriendlyName',
    eventCallbackUrl: 'http://requestb.in/vh9reovh',
  },
  function(err, workspace) {
    console.log(workspace.friendly_name);
  }
);
