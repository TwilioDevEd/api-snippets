# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
taskqueue_sid = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

client = Client(account_sid, auth_token)

statistics = client.taskrouter.workspaces(sid=workspace_sid) \
    .task_queues(sid=taskqueue_sid).task_queue_statistics().fetch()

print(statistics.cumulative["reservations_accepted"])
