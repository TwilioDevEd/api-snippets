# Get the Node helper library from https://twilio.com/docs/libraries/python
from pathlib import Path
from twilio.rest import Client

# Get your Account SID and Auth Token from https://twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Client(account_sid, auth_token)

fleet = client.preview.deployed_devices.fleets.create(
    friendly_name='My Fleet of Devices')

print(fleet.sid)
