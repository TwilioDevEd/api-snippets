# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Find your credentials at twilio.com/console
# To set up environmental variables, see http://twil.io/secure
api_key_sid = os.environ['TWILIO_API_KEY']
api_key_secret = os.environ['TWILIO_API_KEY_SECRET']
client = Client(api_key_sid, api_key_secret)

composition_hook = client.video.composition_hooks.create(
    friendly_name = 'MyHookWithComplexVideoLayout',
    audio_sources = ['listener-audio', 'presenter-audio'],
    video_layout = {
                    'main' : {
                        'z_pos': 1,
                        'video_sources': ['screen']
                        },
                    'pip': {
                        'z_pos': 2,
                        'x_pos': 1000,
                        'y_pos': 30,
                        'width': 240,
                        'height': 180,
                        'video_sources': ['presenter-cam']
                    }
                   },
    status_callback = 'http://my.server.org/callbacks',
    resolution = '1280x720',
    format='mp4')

print('Created Composition Hook with SID=%s' % (composition_hook.sid))
