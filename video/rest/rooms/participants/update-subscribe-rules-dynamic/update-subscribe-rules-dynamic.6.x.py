# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client
import json

# Find your credentials at twilio.com/console
# To set up environmental variables, see http://twil.io/secure
api_key_sid = os.environ['TWILIO_API_KEY']
api_key_secret = os.environ['TWILIO_API_KEY_SECRET']
client = Client(api_key_sid, api_key_secret)


#-------------------------------------------------------------------------------
#1. At connect time Adam wants to receive all the tracks.
#   Done by default rule. No further actions required.


#-------------------------------------------------------------------------------
#2. After a while, Adam notices his bandwidth consumption is too high and
#   decides to unsubscribe from all video tracks

client.video.rooms('RMXXXX').participants.get('Adam')\
.subscribe_rules.update(
  rules = [
    {"type": "include", "kind": "audio"}
  ]
)
print('Subscribe Rules updated successfully')

#-------------------------------------------------------------------------------
#3. Later, a video screenshare track with SID MTXXXX is published to the room
#   and Adam subscribes to it.

client.video.rooms('RMXXXX').participants.get('Adam')\
.subscribe_rules.update(
  rules = [
    {"type": "include", "kind": "audio"},
    {"type": "include", "track": "MTXXXX"}
  ]
)
print('Subscribe Rules updated successfully')

#-------------------------------------------------------------------------------
#4. John, another participant, is in a noisy place and his audio track is
#   annoying. Adam decides to unsubscribe from it.

client.video.rooms('RMXXXX').participants.get('Adam')\
.subscribe_rules.update(
  rules = [
    {"type": "include", "kind": "audio"},
    {"type": "include", "track": "MTXXXX"},
    {"type": "exclude", "publisher": "John", "kind": "audio"}
  ]
)
print('Subscribe Rules updated successfully')
