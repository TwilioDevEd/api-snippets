# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

app = client.applications.create(
    friendly_name="Phone Me",
    voice_url="http://demo.twilio.com/docs/voice.xml",
    voice_method="GET"
)

print(app.sid)
