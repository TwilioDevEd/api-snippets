# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioTaskRouterClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "{{ account_sid }}"
auth_token  = "{{ auth_token }}"
workspace_sid = "{{ workspace_sid }}"

client = TwilioTaskRouterClient(account_sid, auth_token)
workspace = client.workspaces.get(workspace_sid)

workspace = client.workspaces.update(
    workspace_sid,
    friendly_name='NewFriendlyName',
    event_callback_uri='http://requestb.in/vh9reovh')
print(workspace.friendly_name)