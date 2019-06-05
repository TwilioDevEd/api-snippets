# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client
import json

# Find your credentials at twilio.com/console
api_key_sid = 'SKXXXX'
api_key_secret = 'your_api_key_secret'
client = Client(api_key_sid, api_key_secret)

subscribed_track = client.video.rooms('RMXXXX').participants.get('PAXXXX')\
        .subscribed_tracks.get('MTXXXX').fetch()

print('Read track subscribed with sid = %s' % (subscribed_track.sid))
