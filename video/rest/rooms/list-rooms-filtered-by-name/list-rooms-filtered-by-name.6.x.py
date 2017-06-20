# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client
from datetime import date

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

rooms_by_name = client.video.rooms.read( \
  unique_name='DailyStandup')

for room in rooms_by_name:
    print(room.sid)
