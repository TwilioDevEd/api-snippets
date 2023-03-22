# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
task_sid = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

client = Client(account_sid, auth_token)

# update a task's attributes
task = client.taskrouter.workspaces(workspace_sid) \
    .tasks(task_sid).update(attributes='{"type":"support"}')

print(task.attributes)

# alternatively
task = client.taskrouter.workspaces(workspace_sid) \
    .tasks(task_sid).fetch()
task = task.update(attributes='{"type":"support"}')
print(task.attributes)

# cancel a task
task = client.taskrouter.workspaces(workspace_sid).tasks(task_sid) \
    .update(assignment_status='canceled', reason='waiting too long')

print(task.assignment_status)
print(task.reason)
