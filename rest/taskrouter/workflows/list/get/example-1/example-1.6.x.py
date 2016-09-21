# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

client = Client(account_sid, auth_token)

workflows = client.taskrouter.v1.workspaces(sid=workspace_sid).workflows.list()

for workflow in workflows:
    print(workflow.friendly_name)
