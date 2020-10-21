# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
task_channel_sid = 'TCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Client(account_sid, auth_token)

task_channel = client.taskrouter.workspaces(workspace_sid).task_channels(task_channel_sid)

print(task_channel.friendly_name)
print(task_channel.unique_name)
