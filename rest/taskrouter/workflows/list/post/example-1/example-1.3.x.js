// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const client = require('twilio')(accountSid, authToken);

const salesQueue = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const marketingQueue = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const supportQueue = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const everyoneQueue = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

const configuration = {
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

client.taskrouter.v1.workspaces(workspaceSid).workflows.create({
  friendlyName: 'Sales, Marketing, Support Workflow',
  assignmentCallbackUrl: 'http://example.com',
  fallbackAssignmentCallbackUrl: 'http://example2.com',
  taskReservationTimeout: '30',
  configuration: JSON.stringify(configuration),
});
