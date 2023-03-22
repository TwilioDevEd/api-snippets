# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

call = client.calls.create(
    to="+1562300000",
    from_="+18180000000",
    machine_detection="Enable",
    url="https://handler.twilio.com/twiml/EH8ccdbd7f0b8fe34357da8ce87ebe5a16"
)
