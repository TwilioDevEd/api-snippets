# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client
import json

# Find your credentials at twilio.com/console
api_key_sid = 'SKXXXX'
api_key_secret = 'your_api_key_secret'
client = Client(api_key_sid, api_key_secret)

subscribed_tracks = client.video.rooms('RMXXXX').participants.get('PAXXXX')\
        .subscribed_tracks.list()

for subscribed_track in subscribed_tracks:
    print('Read subscribed track with sid = %s' % (subscribed_track))
