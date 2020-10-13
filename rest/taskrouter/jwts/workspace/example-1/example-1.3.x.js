// This snippets constructs the same policy list as seen here:
// https://www.twilio.com/docs/api/taskrouter/constructing-jwts as a base

// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const taskrouter = require('twilio').jwt.taskrouter;
const util = taskrouter.util;

const TaskRouterCapability = taskrouter.TaskRouterCapability;
const Policy = TaskRouterCapability.Policy;

// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const workerSid = 'WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

const TASKROUTER_BASE_URL = 'https://taskrouter.twilio.com';
const version = 'v1';

const capability = new TaskRouterCapability({
  accountSid: accountSid,
  authToken: authToken,
  workspaceSid: workspaceSid,
  channelId: workspaceSid,
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
  workspaceSid
);

const workspacePolicies = [
  // Workspace Policy
  buildWorkspacePolicy(),
  // Workspace subresources fetch Policy
  buildWorkspacePolicy({ resources: ['**'] }),
  // Workspace resources update Policy
  buildWorkspacePolicy({ resources: ['**'], method: 'POST' }),
  // Workspace resources delete Policy
  buildWorkspacePolicy({ resources: ['**'], method: 'DELETE' }),
];

eventBridgePolicies.concat(workspacePolicies).forEach(policy => {
  capability.addPolicy(policy);
});

const token = capability.toJwt();
