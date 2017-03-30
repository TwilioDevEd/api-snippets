# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"

client = Client(account_sid, auth_token)

number = client.api.v2010.account.incoming_phone_numbers.create(
    voice_url="http://demo.twilio.com/docs/voice.xml",
    phone_number="+15005550006"
)

print(number.sid)
