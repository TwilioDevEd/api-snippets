// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var twilio = require('twilio');

var accountSid = "{{ account_sid }}";
var authToken = "{{ auth_token }}";
var workspaceSid = "{{ workspace_sid }}";

var client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

client.workspace.workers.get({"Available":"1"}, function(err, data) {
    if(!err) {
        data.workers.forEach(function(worker) {
            console.log(worker.friendly_name);
        })
    }
});

client.workspace.workers.get({"TaskQueueSid":"WQf855e98ad280d0a0a325628e24ca9627", "Available":"1"}, function(err, data) {
    if(!err) {
        data.workers.forEach(function(worker) {
            console.log(worker.friendly_name);
        })
    }
});

client.workspace.workers.get({"TargetWorkersExpression":"type == 'leads'"}, function(err, data) {
    if(!err) {
        data.workers.forEach(function(worker) {
            console.log(worker.friendly_name);
        })
    }
});