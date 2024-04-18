# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

client = Client(account_sid, auth_token)

tasks = client.taskrouter.workspaces(workspace_sid).tasks \
    .list(task_queue_sid='WQf855e98ad280d0a0a325628e24ca9627')

for task in tasks:
    print(task.attributes)

tasks = client.taskrouter.workspaces(workspace_sid).tasks \
    .list(assignment_status='pending')

for task in tasks:
    print(task.attributes)
