// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const taskrouter = require('twilio').jwt.taskrouter;

const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const workerSid = 'WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

const capability = new taskrouter.TaskRouterCapability({
  accountSid: accountSid,
  authToken: authToken,
  workspaceSid: workspaceSid,
  channelId: workerSid,
  // By default, tokens are good for one hour.
  // Override this default timeout by specifiying a new value (in seconds).
  // For example, to generate a token good for 8 hours:
  ttl: 28800
});

const workspaceUrl = 'https://taskrouter.twilio.com/v1/Workspaces/' + workspaceSid;
const allowActivityUpdates = new Policy({
    url: _.join([workspaceUrl, 'Workers', workerSid], '/'),
    method: 'POST',
    allow: true,
    postFilter: {ActivitySid: {required: true}}
});
const allowTasksUpdates = new Policy({
    url: _.join([workspaceUrl, 'Tasks', '**'], '/'),
    method: 'POST',
    allow: true
});
const allowReservationsUpdates = new Policy({
    url: _.join([workspaceUrl, 'Workers', workerSid, 'Reservations', '**'], '/'),
    method: 'POST',
    allow: true
});
capability.addPolicy(allowActivityUpdates);
capability.addPolicy(allowTasksUpdates);
capability.addPolicy(allowReservationsUpdates);

const token = capability.toJwt();
console.log(token);
