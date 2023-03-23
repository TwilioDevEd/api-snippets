# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
workflow_sid = "WWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

client = Client(account_sid, auth_token)

workflow = client.taskrouter.workspaces(workspace_sid) \
    .workflows(workflow_sid).update(task_reservation_timeout='20')

print(workflow.task_reservation_timeout)

# alternatively
workflow = client.taskrouter.workspaces(workspace_sid) \
    .workflows(workflow_sid).fetch()

workflow = workflow.update(task_reservation_timeout='20')
print(workflow.task_reservation_timeout)
