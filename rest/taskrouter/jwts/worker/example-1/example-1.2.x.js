// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const twilio = require('twilio');

const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
const workerSid = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

const capability = new twilio.TaskRouterWorkerCapability(accountSid, authToken, workspaceSid, workerSid);
capability.allowFetchSubresources();
capability.allowActivityUpdates();
capability.allowReservationUpdates();
const token = capability.generate();

// By default, tokens are good for one hour.
// Override this default timeout by specifiying a new value (in seconds).
// For example, to generate a token good for 8 hours:

const token = capability.generate(28800);  // 60 * 60 * 8
