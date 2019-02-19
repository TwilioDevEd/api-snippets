# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
worker_sid = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

client = Client(account_sid, auth_token)

worker = client.taskrouter.workspaces(workspace_sid) \
    .workers(worker_sid).update(attributes='{"type":"support"}')

print(worker.friendly_name)

# alternatively
worker = client.taskrouter.workspaces(workspace_sid) \
    .workers(worker_sid).fetch()

worker = worker.update(attributes='{"type":"support"}')

print(worker.friendly_name)
