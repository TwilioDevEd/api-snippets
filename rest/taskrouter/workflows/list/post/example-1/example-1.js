// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var twilio = require('twilio');

var accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
var authToken = "your_auth_token";
var workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

var client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

var salesQueue = "YourSalesQueueSid";
var marketingQueue = "YourMarkingQueueSid";
var supportQueue = "YourSupportQueueSid";
var everyoneQueue = "YourEveryoneQueueSid";

var configuration = {
    "task_routing":{
        "filters":[
            {
                "targets":[
                    {
                        "queue": salesQueue
                    }
                ],
                "expression":"type == \"sales\""
            },
            {
                "targets":[
                    {
                        "queue": marketingQueue
                    }
                ],
                "expression":"type == \"marketing\""
            },
            {
                "targets":[
                    {
                        "queue": supportQueue
                    }
                ],
                "expression":"type == \"support\""
            }
        ],
        "default_filter":{
            "queue": everyoneQueue
        }
    }
};

// or utilizing objects
var wb = require('twilio/lib/resources/task_router/WorkflowBuilder');

// sales
var salesTarget = new wb.WorkflowRuleTarget({
    queue: salesQueue
});
var salesRule = new wb.WorkflowRule({
    expression : "type == 'sales'",
    targets : [salesTarget]
});

// marketing
var marketingTarget = new wb.WorkflowRuleTarget({
    queue: marketingQueue
});
var marketingRule = new wb.WorkflowRule({
    expression : "type == 'marketing'",
    targets : [marketingTarget]
});

// support
var supportTarget = new wb.WorkflowRuleTarget({
    queue: supportQueue
});
var supportRule = new wb.WorkflowRule({
    expression : "type == 'support'",
    targets : [supportTarget]
});

// default
var defaultTarget = new wb.WorkflowRuleTarget({
    queue: everyoneQueue
});

// put all together
var taskRouting = new wb.TaskRoutingConfiguration({
    filters : [salesRule, marketingRule, supportRule],
    default_filter : defaultTarget
});
var config = new wb.WorkflowConfiguration({
    taskRouting: taskRouting
});

// convert to json
configuration = config.toJSON();

client.workspace.workflows.create({
    friendlyName: 'Sales, Marketing, Support Workflow',
    assignmentCallbackUrl: 'http://example.com',
    fallbackAssignmentCallbackUrl: 'http://example2.com',
    taskReservationTimeout: '30',
    configuration: configuration
});