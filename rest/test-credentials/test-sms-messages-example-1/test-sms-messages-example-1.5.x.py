# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioRestClient(account_sid, auth_token)

message = client.messages.create(
    body="All in the game, yo", to="+14108675310", from_="+15005550006"
)

print(message.sid)
