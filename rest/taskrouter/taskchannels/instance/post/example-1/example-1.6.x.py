# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
task_channel_sid = 'TCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Client(account_sid, auth_token)

task_channel = client.taskrouter.workspaces(workspace_sid).task_channels(task_channel_sid)

task_channel.update(friendly_name: "My Channel")

print(task_channel.friendly_name)
print(task_channel.unique_name)
