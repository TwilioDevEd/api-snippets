#Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
api_key_sid = = 'SKXXXX'
api_key_secret = 'your_api_key_secret'
client = Client(api_key_sid, api_key_secret)

composition = client.video.compositions.create(\
    audio_sources = 'RTXXXX',\
    status_callback = 'http://my.server.org/callbacks',\
    format='mp4')

print('Created composition with SID=%s' % (composition.sid))
