# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

app = client.applications("AP2a0747eba6abf96b7e3c3ff0b4530f6e") \
            .update(voice_url="http://demo.twilio.com/docs/voice.xml",
                    sms_url="http://demo.twilio.com/docs/sms.xml")

print(app.voice_url)
