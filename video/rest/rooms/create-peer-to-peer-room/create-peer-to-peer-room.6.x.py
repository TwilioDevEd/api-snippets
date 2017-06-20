# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client
from datetime import date

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

p2p_room = client.video.rooms.create( \
  unique_name='DailyStandup', \
  type='peer-to-peer', \
  enable_turn=true, \
  status_callback='http://example.org')

print(p2p_room.sid)
