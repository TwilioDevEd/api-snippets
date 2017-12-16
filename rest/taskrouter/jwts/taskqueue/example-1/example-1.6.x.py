# Download the Python helper library from twilio.com/docs/python/install
from twilio.jwt.taskrouter.capabilities import TaskQueueCapabilityToken

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
task_queue_sid = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

capability = TaskQueueCapabilityToken(
    account_sid=account_sid,
    auth_token=auth_token,
    workspace_sid=workspace_sid,
    task_queue_sid=task_queue_sid
)
capability.allow_fetch_subresources()
capability.allow_update_subresources()
token = capability.to_jwt()

# By default, tokens are good for one hour.
# Override this default timeout by specifiying a new value (in seconds).
# For example, to generate a token good for 8 hours:

# 60 * 60 * 8 = 28800
token = capability.to_jwt(ttl=28800)

print(token)
