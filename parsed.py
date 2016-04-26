# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "AC2e4e4f0260f05ed5b45049894be0ed2d"
auth_token  = "be356ddfbe22fdef22eebbd44cb0bdad"
client = TwilioRestClient(account_sid, auth_token)

account = client.accounts.get("AC2e4e4f0260f05ed5b45049894be0ed2d")
print account.date_created
