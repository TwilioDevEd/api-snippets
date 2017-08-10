# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioRestClient(account_sid, auth_token)

number = client.phone_numbers.purchase(
    friendly_name="My Company Line",
    voice_url="http://demo.twilio.com/docs/voice.xml",
    phone_number="+15105647903",
    voice_method="GET"
)
print(number.sid)
