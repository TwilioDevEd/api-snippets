# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
task_sid = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

client = Client(username=account_sid, password=auth_token)

reservations = client.taskrouter.v1.workspaces(sid=workspace_sid) \
        .tasks(sid=task_sid).reservations.list()

for reservation in reservations:
    print(reservation.reservation_status)
    print(reservation.worker_name)
