# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.task_router import TaskRouterWorkerCapability

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
worker_sid = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

capability = TaskRouterWorkerCapability(
    account_sid, auth_token, workspace_sid, worker_sid
)
capability.allow_fetch_subresources()
capability.allow_activity_updates()
capability.allow_reservation_updates()
token = capability.generate_token()

# By default, tokens are good for one hour.
# Override this default timeout by specifiying a new value (in seconds).
# For example, to generate a token good for 8 hours:

token = capability.generate_token(28800)
# 60 * 60 * 8
