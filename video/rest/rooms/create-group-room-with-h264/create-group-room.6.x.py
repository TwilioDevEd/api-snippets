# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
api_key_sid = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
api_key_secret = "your_api_key_secret"
client = Client(api_key_sid, api_key_secret)

group_room = client.video.rooms.create(
    unique_name='DailyStandupWithH264Codec',
    type='group',
    video_codecs='H264',
    status_callback='http://example.org'
)

print(group_room.sid)
