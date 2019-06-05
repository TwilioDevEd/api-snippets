# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Find your credentials at twilio.com/console
api_key_sid = 'SKXXXX'
api_key_secret = 'your_api_key_secret'
client = Client(api_key_sid, api_key_secret)

compositionHook = client.video.compositionHooks.create(
    friendlyName = 'MyFirstCompositionHook',
    audio_sources = '*',
    video_layout = {
                        'grid' : {
                            'video_sources': ['*']
                        }
                    },
    status_callback = 'http://my.server.org/callbacks',
    format='mp4')

print('Created Composition Hook with SID=%s' % (compositionHook.sid))
