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

statistics = client.taskrouter.workspaces(workspace_sid) \
    .workflows(workflow_sid).statistics().fetch()

print(statistics.cumulative["avg_task_acceptance_time"])
print(statistics.cumulative["tasks_entered"])
print(statistics.realtime["tasks_by_status"]["pending"])
print(statistics.realtime["tasks_by_status"]["assigned"])
