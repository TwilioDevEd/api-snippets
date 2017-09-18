# Get the Node helper library from https://twilio.com/docs/libraries/python
from pathlib import Path
from Twilio.rest import Client

# Get your Account SID and Auth Token from https://twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Client(account_sid, auth_token)

fleet_sid = 'FLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
fleet_service = client.preview.deployed_devices.fleets(fleet_sid)

was_deleted = fleet_service.devices("THXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")\
                           .delete()

print(was_deleted)
