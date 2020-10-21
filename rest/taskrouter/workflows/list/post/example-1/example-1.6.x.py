# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client
import json

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

client = Client(account_sid, auth_token)

sales_queue_sid = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
marketing_queue_sid = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
support_queue_sid = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
everyone_queue_sid = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

config = {
    'task_routing': {
        'filters': [
            {
                'expression': "type=='sales'",
                'targets': [{
                    'queue': sales_queue_sid
                }]
            }, {
                'expression': "type=='marketing'",
                'targets': [{
                    'queue': marketing_queue_sid
                }]
            }, {
                'expression': "type=='support'",
                'targets': [{
                    'queue': support_queue_sid
                }]
            }
        ],
        'default_filter': {
            'queue': everyone_queue_sid
        }
    }
}

workflow = client.taskrouter.workspaces(workspace_sid).workflows.create(
    friendly_name='Sales, Marketing, Support Workflow',
    assignment_callback_url='http://example.com',
    fallback_assignment_callback_url='http://example2.com',
    task_reservation_timeout='30',
    configuration=json.dumps(config)
)

print(workflow.friendly_name)
