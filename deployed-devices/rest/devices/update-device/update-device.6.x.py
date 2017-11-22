# Get the Python helper library from https://twilio.com/docs/libraries/python
from Twilio.rest import Client

# Get your Account SID and Auth Token from https://twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Client(account_sid, auth_token)

fleet_sid = 'FLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
fleet_service = client.preview.deployed_devices.fleets(fleet_sid)

device = fleet_service\
    .devices('THXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')\
    .fetch()\
    .update(friendly_name="My New Device",
            identity="bob@twilio.com")

print(device.friendly_name)
