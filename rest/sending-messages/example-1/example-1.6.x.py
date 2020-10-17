# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

message = client.messages.create(
    "+15558675310",
    body="Let's grab lunch at Milliways tomorrow!",
    from_="+14158141829",
    media_url="http://www.example.com/cheeseburger.png"
)

print(message.sid)
