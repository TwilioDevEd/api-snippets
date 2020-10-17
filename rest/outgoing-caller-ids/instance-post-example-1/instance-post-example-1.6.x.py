# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

caller_id = client.outgoing_caller_ids("PNe536d32a3c49700934481addd5ce1659") \
                  .update(friendly_name="My Second Line")

print(caller_id.phone_number)
