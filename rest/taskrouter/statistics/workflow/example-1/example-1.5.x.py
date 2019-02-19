# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioTaskRouterClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
workflow_sid = "WWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

client = TwilioTaskRouterClient(account_sid, auth_token)

statistics = client.workflows(workspace_sid).get(workflow_sid).statistics.get()
print(statistics.cumulative["avg_task_acceptance_time"])
print(statistics.cumulative["tasks_entered"])
print(statistics.realtime["tasks_by_status"]["pending"])
print(statistics.realtime["tasks_by_status"]["assigned"])
