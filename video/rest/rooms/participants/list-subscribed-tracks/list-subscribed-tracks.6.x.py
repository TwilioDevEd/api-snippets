# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client
import json

# Find your credentials at twilio.com/console
# To set up environmental variables, see http://twil.io/secure
api_key_sid = os.environ['TWILIO_API_KEY']
api_key_secret = os.environ['TWILIO_API_KEY_SECRET']
client = Client(api_key_sid, api_key_secret)

subscribed_tracks = client.video.rooms('RMXXXX').participants.get('PAXXXX')\
        .subscribed_tracks.list()

for subscribed_track in subscribed_tracks:
    print('Read subscribed track with sid = %s' % (subscribed_track))
