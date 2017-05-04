// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const taskrouter = require('twilio').jwt.taskrouter;

const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const taskQueueSid = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

const capability = new taskrouter.TaskRouterCapability({
    accountSid: accountSid,
    authToken: authToken,
    workspaceSid: workspaceSid,
    channelId: taskQueueSid,
    // By default, tokens are good for one hour.
    // Override this default timeout by specifiying a new value (in seconds).
    // For example, to generate a token good for 8 hours:
    ttl: 28800
});

const workspaceUrl = 'https://taskrouter.twilio.com/v1/Workspaces/' + workspaceSid;
const allowFetchSubresources = new Policy({
    url: _.join([workspaceUrl, 'TaskQueues', taskQueueSid, '**'], '/'),
    method: 'GET',
    allow: true
});
const allowUpdates = new Policy({
    url: workspaceUrl,
    method: 'POST',
    allow: true
});
capability.addPolicy(allowFetchSubresources);
capability.addPolicy(allowUpdates);

const token = capability.toJwt();
console.log(token);