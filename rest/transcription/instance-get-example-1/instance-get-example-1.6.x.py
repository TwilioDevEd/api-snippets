# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

transcription_sid = "TR8c61027b709ffb038236612dc5af8723"
transcription = client.transcriptions(transcription_sid).fetch()

print(transcription.transcription_text)
