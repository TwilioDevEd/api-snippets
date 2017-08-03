// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const twilio = require('twilio');

const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

const client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

const salesQueue = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const marketingQueue = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const supportQueue = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const everyoneQueue = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

let configuration = {
  task_routing: {
    filters: [
      {
        targets: [
          {
            queue: salesQueue,
          },
        ],
        expression: 'type == "sales"',
      },
      {
        targets: [
          {
            queue: marketingQueue,
          },
        ],
        expression: 'type == "marketing"',
      },
      {
        targets: [
          {
            queue: supportQueue,
          },
        ],
        expression: 'type == "support"',
      },
    ],
    default_filter: {
      queue: everyoneQueue,
    },
  },
};

// or utilizing objects
const wb = require('twilio/lib/resources/task_router/WorkflowBuilder');

// sales
const salesTarget = new wb.WorkflowRuleTarget({
  queue: salesQueue,
});
const salesRule = new wb.WorkflowRule({
  expression: "type == 'sales'",
  targets: [salesTarget],
});

// marketing
const marketingTarget = new wb.WorkflowRuleTarget({
  queue: marketingQueue,
});
const marketingRule = new wb.WorkflowRule({
  expression: "type == 'marketing'",
  targets: [marketingTarget],
});

// support
const supportTarget = new wb.WorkflowRuleTarget({
  queue: supportQueue,
});
const supportRule = new wb.WorkflowRule({
  expression: "type == 'support'",
  targets: [supportTarget],
});

// default
const defaultTarget = new wb.WorkflowRuleTarget({
  queue: everyoneQueue,
});

// put all together
const taskRouting = new wb.TaskRoutingConfiguration({
  filters: [salesRule, marketingRule, supportRule],
  default_filter: defaultTarget,
});
const config = new wb.WorkflowConfiguration({
  taskRouting: taskRouting,
});

// convert to json
configuration = config.toJSON();

client.workspace.workflows.create({
  friendlyName: 'Sales, Marketing, Support Workflow',
  assignmentCallbackUrl: 'http://example.com',
  fallbackAssignmentCallbackUrl: 'http://example2.com',
  taskReservationTimeout: '30',
  configuration: configuration,
});
