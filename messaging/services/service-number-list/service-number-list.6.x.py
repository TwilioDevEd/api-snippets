# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

phone_numbers = client.messaging \
                      .services(sid="MG2172dd2db502e20dd981ef0d67850e1a") \
                      .phone_numbers \
                      .list()

for phone_number in phone_numbers:
    print(phone_number.sid)
