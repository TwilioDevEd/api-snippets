// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const taskrouter = require('twilio').jwt.taskrouter;
const util = taskrouter.util;

const TaskRouterCapability = taskrouter.TaskRouterCapability;
const Policy = TaskRouterCapability.Policy;

const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const workerSid = 'WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

const TASKROUTER_BASE_URL = 'https://taskrouter.twilio.com';
const version = 'v1';

const capability = new TaskRouterCapability({
  accountSid: accountSid,
  authToken: authToken,
  workspaceSid: workspaceSid,
  channelId: workerSid,
});

// Helper function to create Policy
function buildWorkspacePolicy(options) {
  options = options || {};
  let resources = options.resources || [];
  let urlComponents = [
    TASKROUTER_BASE_URL,
    version,
    'Workspaces',
    workspaceSid,
  ];

  return new Policy({
    url: urlComponents.concat(resources).join('/'),
    method: options.method || 'GET',
    allow: true,
  });
}

// Event Bridge Policies
let eventBridgePolicies = util.defaultEventBridgePolicies(
  accountSid,
  workerSid
);

let workspacePolicies = [
  // Workspace fetch Policy
  buildWorkspacePolicy(),
  // Workspace Activities Update Policy
  buildWorkspacePolicy({ resources: ['Activities'], method: 'POST' }),
  // Workspace Activities Worker Reserations Policy
  buildWorkspacePolicy({
    resources: ['Workers', workerSid, 'Reservations', '**'],
    method: 'POST',
  }),
];

eventBridgePolicies.concat(workspacePolicies).forEach(function(policy) {
  capability.addPolicy(policy);
});

let token = capability.toJwt();
