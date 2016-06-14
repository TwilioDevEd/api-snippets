# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioTaskRouterClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token  = "{{ auth_token }}"
workspace_sid = "{{ workspace_sid }}"
task_sid = "{{ task_sid }}"
reservation_sid = "{{ reservation_sid }}"

client = TwilioTaskRouterClient(account_sid, auth_token)

# call using a reservation
reservation = client.reservations(workspace_sid, task_sid).update(reservation_sid,
	instruction='call',
	call_from='+15558675309',
	call_url='http://example.com/agent_answer',
	call_status_callback_url='http://example.com/agent_answer_status_callback',
	call_accept='true')
print(reservation.reservation_status)
print(reservation.worker_name)

