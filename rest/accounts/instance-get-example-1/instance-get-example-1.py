# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACba8bc05eacf94afdae398e642c9cc32d"
auth_token  = "{{ auth_token }}"
client = TwilioRestClient(account_sid, auth_token)

account = client.accounts.get("ACba8bc05eacf94afdae398e642c9cc32d")
print account.date_created
