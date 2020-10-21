# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

# A list of caller_id objects with the properties described above
caller_ids = client.outgoing_caller_ids \
                   .list(phone_number="+12349013030")

for caller_id in caller_ids:
    print(caller_id.phone_number)
