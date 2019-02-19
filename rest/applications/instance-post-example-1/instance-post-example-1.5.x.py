# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioRestClient(account_sid, auth_token)

app = client.applications.update(
    "AP2a0747eba6abf96b7e3c3ff0b4530f6e",
    voice_url="http://demo.twilio.com/docs/voice.xml",
    sms_url="http://demo.twilio.com/docs/sms.xml"
)
print(app.voice_url)
