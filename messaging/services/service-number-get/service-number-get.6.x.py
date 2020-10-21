# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

phone_number = client.messaging \
                     .services(sid="MG2172dd2db502e20dd981ef0d67850e1a") \
                     .phone_numbers(sid="PN557ce644e5ab84fa21cc21112e22c485") \
                     .fetch()

print(phone_number.country_code)
