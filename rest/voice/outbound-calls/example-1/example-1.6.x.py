# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"

client = Client(account_sid, auth_token)

call = client.api.v2010.account.calls.create(url="http://demo.twilio.com/docs/voice.xml",
                                   to="+123456789",
                                   from_="+987654321")

print(call.sid)
