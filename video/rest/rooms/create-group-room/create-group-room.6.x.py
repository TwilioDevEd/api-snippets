# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

group_room = client.video.rooms.create( \
    unique_name='DailyStandup', \
    type='group', \
    record_participants_on_connect=True, \
    status_callback='http://example.org')

print(group_room.sid)
