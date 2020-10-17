# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account = os.environ['TWILIO_ACCOUNT_SID']
token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account, token)

user = client.chat \
             .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
             .users("USXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
             .fetch()

print(user.identity)
