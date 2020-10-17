# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.jwt.taskrouter.capabilities import WorkerCapabilityToken

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
worker_sid = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

capability = WorkerCapabilityToken(
    account_sid=account_sid,
    auth_token=auth_token,
    workspace_sid=workspace_sid,
    worker_sid=worker_sid
)
capability.allow_fetch_subresources()
capability.allow_update_activities()
capability.allow_update_reservations()
token = capability.to_jwt()

# By default, tokens are good for one hour.
# Override this default timeout by specifiying a new value (in seconds).
# For example, to generate a token good for 8 hours:

# 60 * 60 * 8 = 28800
token = capability.to_jwt(ttl=28800)

print(token)
