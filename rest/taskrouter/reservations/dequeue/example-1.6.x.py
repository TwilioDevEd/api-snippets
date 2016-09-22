# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
task_sid = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
reservation_sid = "WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

client = Client(username=account_sid, password=auth_token)

# dequeue a reservation
reservation = client.taskrouter.v1.workspaces(sid=workspace_sid) \
        .tasks(sid=task_sid).reservations(sid=reservation_sid) \
        .update(instruction='dequeue', dequeue_from='+18001231234')

print(reservation.reservation_status)
print(reservation.worker_name)
