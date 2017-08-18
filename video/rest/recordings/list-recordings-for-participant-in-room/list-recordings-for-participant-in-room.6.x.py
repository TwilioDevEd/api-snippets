# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
api_key_sid = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
api_key_secret = "your_api_key_secret"
client = Client(api_key_sid, api_key_secret)

recordings = client.video \
    .recordings \
    .list(grouping_sid=['ParticipantSid', 'RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'])

for recording in recordings:
    print(recording.sid)
