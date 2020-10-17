# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token can be found at https://www.twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

# Start a phone call
call = client.calls.create(
    to="+15558675310",
    from_="+15017122661",
    url="http://demo.twilio.com/docs/voice.xml"
)

print(call.sid)
