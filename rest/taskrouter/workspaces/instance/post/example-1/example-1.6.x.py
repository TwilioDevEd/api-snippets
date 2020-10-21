# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

client = Client(account_sid, auth_token)

workspace = client.taskrouter.workspaces(workspace_sid) \
    .update(friendly_name='NewFriendlyName',
            event_callback_url='http://requestb.in/vh9reovh')

print(workspace.friendly_name)

# alternatively
workspace = client.taskrouter.workspaces(workspace_sid).fetch()

workspace = workspace.update(
    friendly_name='NewFriendlyName',
    event_callback_url='http://requestb.in/vh9reovh'
).fetch()

print(workspace.friendly_name)
