# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"

client = Client(account_sid, auth_token)

# A list of transcription objects with the properties described above
transcriptions = client.transcriptions.list()

for transcription in transcriptions:
    print(transcription.transcription_text)
