# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

client = Client(account_sid, auth_token)

task_channels = client.taskrouter.workspaces(workspace_sid).task_channels.list()

for task_channel in task_channels:
    print(task_channel.friendly_name)
    print(task_channel.unique_name)
