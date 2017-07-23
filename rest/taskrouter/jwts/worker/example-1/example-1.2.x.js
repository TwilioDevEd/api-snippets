// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let twilio = require('twilio');

let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let workerSid = 'WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

let capability = new twilio.TaskRouterWorkerCapability(
  accountSid,
  authToken,
  workspaceSid,
  workerSid
);
capability.allowActivityUpdates();
capability.allowReservationUpdates();
let token = capability.generate();

// By default, tokens are good for one hour.
// Override this default timeout by specifiying a new value (in seconds).
// For example, to generate a token good for 8 hours:

token = capability.generate(28800); // 60 * 60 * 8
