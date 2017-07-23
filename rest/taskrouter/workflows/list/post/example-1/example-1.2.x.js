// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let twilio = require('twilio');

let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

let client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

let salesQueue = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let marketingQueue = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let supportQueue = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let everyoneQueue = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

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
let wb = require('twilio/lib/resources/task_router/WorkflowBuilder');

// sales
let salesTarget = new wb.WorkflowRuleTarget({
  queue: salesQueue,
});
let salesRule = new wb.WorkflowRule({
  expression: "type == 'sales'",
  targets: [salesTarget],
});

// marketing
let marketingTarget = new wb.WorkflowRuleTarget({
  queue: marketingQueue,
});
let marketingRule = new wb.WorkflowRule({
  expression: "type == 'marketing'",
  targets: [marketingTarget],
});

// support
let supportTarget = new wb.WorkflowRuleTarget({
  queue: supportQueue,
});
let supportRule = new wb.WorkflowRule({
  expression: "type == 'support'",
  targets: [supportTarget],
});

// default
let defaultTarget = new wb.WorkflowRuleTarget({
  queue: everyoneQueue,
});

// put all together
let taskRouting = new wb.TaskRoutingConfiguration({
  filters: [salesRule, marketingRule, supportRule],
  default_filter: defaultTarget,
});
let config = new wb.WorkflowConfiguration({
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
