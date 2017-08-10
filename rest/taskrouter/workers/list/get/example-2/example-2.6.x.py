# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

client = Client(account_sid, auth_token)


workers = client.taskrouter.workspaces(workspace_sid) \
                  .workers.list(available=1)
for worker in workers:
    print(worker.friendly_name)

task_queue_sid = 'WQf855e98ad280d0a0a325628e24ca9627'
workers = client.taskrouter.workspaces(workspace_sid) \
                  .workers.list(available=1, task_queue_sid=task_queue_sid)
for worker in workers:
    print(worker.friendly_name)

expression = "type == 'leads'"
workers = client.taskrouter.workspaces(workspace_sid) \
                  .workers.list(target_workers_expression=expression)
for worker in workers:
    print(worker.friendly_name)
