# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# required for all twilio access tokens
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Client(account_sid, auth_token)

client.wireless.commands \
    .create(command='SGVsbG8sIE1hY2hpbmUh==',
            sim='AliceSmithSmartMeter',
            command_mode='binary')
