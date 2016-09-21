# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
workflow_sid = "WWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

client = Client(username=account_sid, password=auth_token)

workflow = client.taskrouter.v1.workspaces(sid=workspace_sid) \
    .workflows(sid=workflow_sid).fetch()

print(workflow.friendly_name)
