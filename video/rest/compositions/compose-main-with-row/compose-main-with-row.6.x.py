# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client
import json

# Find your credentials at twilio.com/console
api_key_sid = = 'SKXXXX'
api_key_secret = 'your_api_key_secret'
client = Client(api_key_sid, api_key_secret)

composition = client.video.compositions.create(
    room_sid = 'RMXXXX',
    audio_sources = '*',
    video_layout = {
                        'main' : {
                            'z_pos': 1,
                            'video_sources': ['teacher-screen-video']
                        },
                        'row': {
                            'z_pos': 2,
                            'x_pos': 10,
                            'y_pos': 530,
                            'width': 1260,
                            'height': 160,
                            'max_rows': 1,
                            'video_sources': ['*'],
                            'video_sources_excluded': ['teacher-screen-video']
                        }
                    },
    status_callback = 'http://my.server.org/callbacks',
    resolution = '1280x720',
    format='mp4')

print('Created composition with SID=%s' % (composition.sid))
