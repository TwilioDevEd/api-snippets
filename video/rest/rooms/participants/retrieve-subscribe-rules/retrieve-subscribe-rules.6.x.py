# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client
import json

# Find your credentials at twilio.com/console
api_key_sid = 'SKXXXX'
api_key_secret = 'your_api_key_secret'
client = Client(api_key_sid, api_key_secret)

subscribe_rules = client.video.rooms('RMXXXX').participants.get('PAXXXX')\
.subscribe_rules.fetch()

for rule in subscribe_rules.rules:
    print('Read rule with type=%s' % (rule["type"]))
