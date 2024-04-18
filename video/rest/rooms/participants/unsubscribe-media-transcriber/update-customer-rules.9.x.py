# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client
import json

# Find your credentials at twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID’]
auth_token = os.environ['TWILIO_AUTH_TOKEN’]
client = Client(account_sid, auth_token)

client.video.rooms('RMXXXX').participants.get('media-transcriber')\
.subscribe_rules.update(
    rules = [
        {"type": "include", "publisher": "Instructor"}
    ]
)

print('Subscribe Rules updated successfully')
