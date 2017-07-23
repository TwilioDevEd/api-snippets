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
  const resources = options.resources || [];
  const urlComponents = [
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
const eventBridgePolicies = util.defaultEventBridgePolicies(
  accountSid,
  workerSid
);

const workspacePolicies = [
  // Workspace fetch Policy
  buildWorkspacePolicy(),
  // Workspace subresources fetch Policy
  buildWorkspacePolicy({ resources: ['**'] }),
  // Workspace Tasks Update Policy
  buildWorkspacePolicy({
    resources: ['Workers', workerSid, 'Tasks', '**'],
    method: 'POST',
  }),
];

eventBridgePolicies.concat(workspacePolicies).forEach(function(policy) {
  capability.addPolicy(policy);
});

const token = capability.toJwt();
