# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

number = client.incoming_phone_numbers \
               .create(friendly_name="My Company Line",
                       voice_url="http://demo.twilio.com/docs/voice.xml",
                       phone_number="+15105647903",
                       voice_method="GET")

print(number.sid)
