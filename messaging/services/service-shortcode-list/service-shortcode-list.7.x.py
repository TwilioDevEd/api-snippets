# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

short_codes = client.messaging \
    .services(sid="MG2172dd2db502e20dd981ef0d67850e1a") \
    .short_codes \
    .list()

for short_code in short_codes:
    print(short_code.sid)
