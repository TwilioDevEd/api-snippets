# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

numbers = client.available_phone_numbers("GB") \
                .local \
                .list(voice_enabled=True)

number = client.incoming_phone_numbers \
               .create(phone_number=numbers[0].phone_number)

print(number.sid)
