# Get the Node helper library from https://twilio.com/docs/libraries/python
from pathlib import Path
from twilio.rest import Client

# Get your Account SID and Auth Token from https://twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Client(account_sid, auth_token)

fleet_sid = 'FLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
key_sid = 'KYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
fleet_service = client.preview.deployed_devices.fleets(sid=fleet_sid)

deleted = fleet_service.keys(sid=key_sid).delete()

print(deleted)
