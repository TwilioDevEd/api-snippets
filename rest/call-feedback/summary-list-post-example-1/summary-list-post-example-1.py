# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token  = "{{ auth_token }}"
client = TwilioRestClient(account_sid, auth_token)

request = client.calls.feedback_summary.create(
    '2014-06-01',
    '2014-06-30',
    include_subaccounts=True,
    status_callback='http://example.com/callback',
)

print summary.status, summary.sid
