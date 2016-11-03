// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const client = require('twilio')(accountSid, authToken);

const salesQueue = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const marketingQueue = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const supportQueue = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const everyoneQueue = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

const configuration = {
    'task_routing': {
        'filters': [
            {
                'targets': [
                    {
                        'queue': salesQueue
                    }
                ],
                'expression': 'type == "sales"'
            },
            {
                'targets': [
                    {
                        'queue': marketingQueue
                    }
                ],
                'expression': 'type == "marketing"'
            },
            {
                'targets': [
                    {
                        'queue': supportQueue
                    }
                ],
                'expression': 'type == "support"'
            }
        ],
        'default_filter': {
            'queue': everyoneQueue
        }
    }
};

client.taskrouter.v1
  .workspaces(workspaceSid)
  .workflows
  .create({
    friendlyName: 'Sales, Marketing, Support Workflow',
    assignmentCallbackUrl: 'http://example.com',
    fallbackAssignmentCallbackUrl: 'http://example2.com',
    taskReservationTimeout: '30',
    configuration: JSON.stringify(configuration)
  });
