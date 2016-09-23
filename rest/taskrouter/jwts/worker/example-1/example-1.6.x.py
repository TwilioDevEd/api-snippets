# Download the Python helper library from twilio.com/docs/python/install
from twilio.task_router import TaskRouterWorkerCapability

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
worker_sid = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

capability = TaskRouterWorkerCapability(
    account_sid=account_sid, auth_token=auth_token,
    workspace_sid=workspace_sid, worker_sid=worker_sid
)
capability.allow_activity_updates()
capability.allow_reservation_updates()
token = capability.generate_token()

# By default, tokens are good for one hour.
# Override this default timeout by specifiying a new value (in seconds).
# For example, to generate a token good for 8 hours:

# 60 * 60 * 8 = 28800
token = capability.generate_token(28800)

print(token)
