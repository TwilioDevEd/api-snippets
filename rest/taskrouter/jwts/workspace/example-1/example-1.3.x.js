// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const twilio = require('twilio');

const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const workerSid = 'WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

const capability = new twilio.jwt.TaskRouterWorkspaceCapability(accountSid,
  authToken,
  workspaceSid,
  workerSid);

capability.allowFetchSubresources();
capability.allowUpdatesSubresources();
capability.allowDeleteSubresources();

var token = capability.generate();

// By default, tokens are good for one hour.
// Override this default timeout by specifiying a new value (in seconds).
// For example, to generate a token good for 8 hours:
token = capability.generate(28800);  // 60 * 60 * 8
