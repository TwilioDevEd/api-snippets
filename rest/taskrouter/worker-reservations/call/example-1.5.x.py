# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioTaskRouterClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
worker_sid = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
reservation_sid = "WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

client = TwilioTaskRouterClient(account_sid, auth_token)
call_status_callback_url = 'http://example.com/agent_answer_status_callback'

# call using a reservation
reservation = client.workers(workspace_sid).get(worker_sid) \
    .reservations.update(
        reservation_sid,
        instruction='call',
        call_from='+15558675310',
        call_url='http://example.com/agent_answer',
        call_status_callback_url=call_status_callback_url,
        call_accept='true')
print(reservation.reservation_status)
print(reservation.worker_name)
