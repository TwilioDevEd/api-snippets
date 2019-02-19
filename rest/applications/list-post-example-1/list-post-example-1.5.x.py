# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioRestClient(account_sid, auth_token)

app = client.applications.create(
    friendly_name="Phone Me",
    voice_url="http://demo.twilio.com/docs/voice.xml",
    voice_method="GET"
)
print(app.sid)
