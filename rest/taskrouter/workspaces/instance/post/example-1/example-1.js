// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var twilio = require('twilio');

var accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
var authToken = "{{ auth_token }}";
var workspaceSid = "{{ workspace_sid }}";

var client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

client.workspace.update({
    friendlyName: 'NewFriendlyName',
    eventCallbackUrl: 'http://requestb.in/vh9reovh'
}, function(err, workspace) {
    console.log(workspace.friendly_name);
});