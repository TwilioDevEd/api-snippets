# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
task_sid = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
reservation_sid = "WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

client = Client(account_sid, auth_token)
call_status_callback_url = 'http://example.com/agent_answer_status_callback'

# call using a reservation
reservation = client.taskrouter.workspaces(workspace_sid) \
    .tasks(task_sid).reservations(reservation_sid) \
    .update(
        instruction='call',
        call_accept='true',
        call_from='+15558675310',
        call_url='http://example.com/agent_answer',
        call_status_callback_url=call_status_callback_url)

print(reservation.reservation_status)
print(reservation.worker_name)
