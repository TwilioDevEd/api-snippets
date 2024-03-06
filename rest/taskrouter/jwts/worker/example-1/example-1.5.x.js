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
  channelId: workerSid});

// Helper function to create Policy
function buildWorkspacePolicy(options) {
  options = options || {};
  var resources = options.resources || [];
  var urlComponents = [TASKROUTER_BASE_URL, version, 'Workspaces', workspaceSid]

  return new Policy({
    url: urlComponents.concat(resources).join('/'),
    method: options.method || 'GET',
    allow: true
  });
}

// Event Bridge Policies
const eventBridgePolicies = util.defaultEventBridgePolicies(accountSid, workerSid);

// Worker Policies
const workerPolicies = util.defaultWorkerPolicies(version, workspaceSid, workerSid);

const workspacePolicies = [
  // Workspace fetch Policy
  buildWorkspacePolicy(),
  // Workspace subresources fetch Policy
  buildWorkspacePolicy({ resources: ['**'] }),
  // Workspace Activities Update Policy
  buildWorkspacePolicy({ resources: ['Activities'], method: 'POST' }),
  // Workspace Activities Worker Reserations Policy
  buildWorkspacePolicy({ resources: ['Workers', workerSid, 'Reservations', '**'], method: 'POST' }),
];

eventBridgePolicies.concat(workerPolicies).concat(workspacePolicies).forEach(function (policy) {
  capability.addPolicy(policy);
});

const token = capability.toJwt();
