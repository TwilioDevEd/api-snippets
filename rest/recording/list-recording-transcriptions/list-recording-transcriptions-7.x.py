# Download the helper library from https://www.twilio.com/docs/python/install
import os
from twilio.rest import Client


# Your Account Sid and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

recording = client.recordings.get('REXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

for transcription in recording.transcriptions.list():
    print(transcription.sid)
    print(transcription.transcription_text)
