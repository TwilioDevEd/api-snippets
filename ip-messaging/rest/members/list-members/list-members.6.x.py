# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Initialize the client
# To set up environmental variables, see http://twil.io/secure
account = os.environ['TWILIO_ACCOUNT_SID']
token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account, token)

members = client.chat \
                .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
                .channels("CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
                .members \
                .list()

for member in members:
    print(member.sid)
