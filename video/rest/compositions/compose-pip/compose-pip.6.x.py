# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client
import json

# Find your credentials at twilio.com/console
# To set up environmental variables, see http://twil.io/secure
api_key_sid = os.environ['TWILIO_API_KEY']
api_key_secret = os.environ['TWILIO_API_KEY_SECRET']
client = Client(api_key_sid, api_key_secret)

composition = client.video.compositions.create(
    room_sid = 'RMXXXX',
    audio_sources = ['MTAAAA', 'soundtrack'],
    video_layout = {
                    'main' : {
                        'z_pos': 1,
                        'video_sources': ['screen-presentation']
                        },
                    'pip': {
                        'z_pos': 2,
                        'x_pos': 1000,
                        'y_pos': 30,
                        'width': 240,
                        'height': 180,
                        'video_sources': ['MTBBBB']
                    }
                   },
    status_callback = 'http://my.server.org/callbacks',
    resolution = '1280x720',
    format='mp4')

print('Created composition with SID=%s' % (composition.sid))
