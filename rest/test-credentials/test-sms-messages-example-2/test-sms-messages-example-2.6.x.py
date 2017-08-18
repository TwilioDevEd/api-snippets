# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"

client = Client(account_sid, auth_token)

message = client.messages.create(
    body="Hey Mr Nugget, you the bomb!",
    to="+15005550009",
    from_="+15005550006"
)

print(message.sid)
