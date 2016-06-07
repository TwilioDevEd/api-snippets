# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioTaskRouterClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token  = "{{ auth_token }}"
workspace_sid = "{{ workspace_sid }}"

client = TwilioTaskRouterClient(account_sid, auth_token)

taskqueue = client.taskqueues(workspace_sid).create(
    friendly_name='English',
    reservation_activity_sid='WAxxxx',
    assignment_activity_sid='WAyyyy',
    target_workers='languages HAS "english"'
)

print taskqueue.friendly_name