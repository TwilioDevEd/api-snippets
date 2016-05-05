# Download the Python helper library from twilio.com/docs/python/install
from twilio import jwt
from twilio.task_router import TaskRouterWorkspaceCapability

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token  = "{{ auth_token }}"
workspace_sid = "{{ workspace_sid }}"

capability = TaskRouterWorkspaceCapability(account_sid, auth_token, workspace_sid)
capability.allow_fetch_subresources()
capability.allow_updates_subresources()
capability.allow_deletes_subresources()
token = capability.generate_token()

# By default, tokens are good for one hour.
# Override this default timeout by specifiying a new value (in seconds).
# For example, to generate a token good for 8 hours:

token = capability.generate_token(28800); # 60 * 60 * 8