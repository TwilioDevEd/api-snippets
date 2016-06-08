// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var twilio = require('twilio');

var accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
var authToken = "{{ auth_token }}";
var workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
var taskQueueSid = "{{ taskqueue_sid }}";

var capability = new twilio.TaskRouterTaskQueueCapability(accountSid, authToken, workspaceSid, taskQueueSid);
capability.allowFetchSubresources();
capability.allowUpdates();
var token = capability.generateToken();

// By default, tokens are good for one hour.
// Override this default timeout by specifiying a new value (in seconds).
// For example, to generate a token good for 8 hours:

var token = capability.generateToken(28800);  // 60 * 60 * 8