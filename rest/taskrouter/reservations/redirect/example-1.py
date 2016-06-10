# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioTaskRouterClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "{{ account_sid }}"
auth_token  = "{{ auth_token }}"
workspace_sid = "{{ workspace_sid }}"
task_sid = "{{ task_sid }}"
reservation_sid = "{{ reservation_sid }}"

client = TwilioTaskRouterClient(account_sid, auth_token)

# redirect using a reservation
reservation = client.reservations(workspace_sid, task_sid).update(reservation_sid,
	Instruction='Redirect',
	RedirectCallSid='CA123456789',
	RedirectUrl='http://example.com/assignment_redirect')
print(reservation.reservation_status)
print(reservation.worker_name)

