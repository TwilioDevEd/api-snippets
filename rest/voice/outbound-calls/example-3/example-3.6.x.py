# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"

client = Client(username=account_sid, password=auth_token)

call = client.api.v2010.accounts(sid=account_sid) \
        .calls.create(url="http://demo.twilio.com/docs/voice.xml",
                      to="+14155551212",
                      send_digits="1234#",
                      from_="+18668675309",
                      method="GET")

print(call.sid)
