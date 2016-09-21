# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

client = Client(username=account_sid, password=auth_token)

workspace = client.taskrouter.v1.workspaces(sid=workspace_sid) \
                .update(friendly_name='NewFriendlyName',
                        event_callback_url='http://requestb.in/vh9reovh')

print(workspace.friendly_name)

# alternatively
workspace = client.taskrouter.v1.workspaces(sid=workspace_sid).fetch()

workspace = workspace.update(
    friendly_name='NewFriendlyName',
    event_callback_url='http://requestb.in/vh9reovh'
).fetch()

print(workspace.friendly_name)
