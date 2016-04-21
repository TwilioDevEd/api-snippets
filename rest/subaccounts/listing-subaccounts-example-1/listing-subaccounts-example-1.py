# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "AC1365ff479ef6502d85c27be6467a310c"
auth_token  = "{{ auth_token }}"
client = TwilioRestClient(account_sid, auth_token)

account = client.accounts.get("AC1365ff479ef6502d85c27be6467a310c")
print account.status
