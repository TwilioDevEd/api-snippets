# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioTaskRouterClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token  = "{{ auth_token }}"
workspace_sid = "{{ workspace_sid }}"
worker_sid = "{{ worker_sid }}"

client = TwilioTaskRouterClient(account_sid, auth_token)

worker = client.workers(workspace_sid).get(worker_sid)
print worker.friendly_name