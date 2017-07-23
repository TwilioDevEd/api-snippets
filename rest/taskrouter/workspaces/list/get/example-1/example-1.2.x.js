// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var twilio = require('twilio');

var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

var client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

client.workspaces.list(function(err, data) {
  data.workspaces.forEach(function(workspace) {
    console.log(workspace.friendly_name);
  });
});
