// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const TaskRouterCapability = require('twilio').jwt.taskrouter.TaskRouterCapability;
const util = require('twilio').jwt.taskrouter.util;

const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const workerSid = 'WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

// By default, tokens are good for one hour.
// Override this default timeout by specifiying a new value (in seconds).
// For example, to generate a token good for 8 hours:
const capability = new TaskRouterCapability({
    accountSid: accountSid,
    authToken: authToken,
    workspaceSid: workspaceSid,
    channelId: workerSid,
    ttl: 28800});  // 60 * 60 * 8

const workerPolicies = util.defaultWorkerPolicies('v1', workspaceSid, workerSid);
workerPolicies.forEach(function(policy) {
  console.log(policy);
  capability.addPolicy(policy);
});

const eventBridgePolicies = util.defaultEventBridgePolicies(accountSid, workerSid);
eventBridgePolicies.forEach(function(policy) {
  console.log(policy);
  capability.addPolicy(policy);
});

capability.toJwt()
