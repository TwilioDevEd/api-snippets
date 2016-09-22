# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
worker_sid = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
reservation_sid = 'WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Client(account_sid, auth_token)

reservation = client.taskrouter.workspaces(workspace_sid) \
        .workers(worker_sid).reservations(reservation_sid) \
        .update(reservation_status='accepted')

# accept a reservation
print(reservation.reservation_status)
print(reservation.worker_name)
