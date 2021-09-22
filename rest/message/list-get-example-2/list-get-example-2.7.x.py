# Download the Python helper library from twilio.com/docs/libraries/python
import os
from datetime import date
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

# A list of message objects with filtering
messages = client.messages \
                 .list(to='+15558675310',
                       from_='+15017122661',
                       date_sent=date(2016, 8, 31))

for message in messages:
    print(message.direction)
