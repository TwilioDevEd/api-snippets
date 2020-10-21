# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
api_key = os.environ['TWILIO_API_KEY']
api_secret = os.environ['TWILIO_API_KEY_SECRET']

client = Client(api_key, api_secret, account_sid)

message = client.messages.create(
    "+15558675310",
    from_='+15017122661',  # twilio number
    body='Never gonna give you up.'
)

print(message.sid)
