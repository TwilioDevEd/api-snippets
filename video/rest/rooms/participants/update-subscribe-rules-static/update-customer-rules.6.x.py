# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Find your credentials at twilio.com/console
# To set up environmental variables, see http://twil.io/secure
api_key_sid = os.environ['TWILIO_API_KEY']
api_key_secret = os.environ['TWILIO_API_KEY_SECRET']
client = Client(api_key_sid, api_key_secret)

client.video.rooms('RMXXXX').participants.get('Customer')\
    .subscribe_rules.update(
    rules=[
        {"type": "include", "all": True},
        {"type": "exclude", "publisher": "Supervisor"}
    ]
)

print('Subscribe Rules updated successfully')
