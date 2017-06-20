# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client
from datetime import date

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

room_recordings = client.video.rooms(sid="RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
                              .recordings.list()

for recording in room_recordings:
    print(recording.sid)
