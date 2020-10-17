# Get the Python helper library from https://twilio.com/docs/libraries/python
import os
from pathlib import Path
from twilio.rest import Client

# Get your Account SID and Auth Token from https://twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

fleet_sid = 'FLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
fleet_service = client.preview.deployed_devices.fleets(fleet_sid)

certificate = fleet_service.certificates.create({
    'device_sid': 'THXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    'friendly_name': 'Woody',
    'certificate_data': Path('/path/to/certificate.pem').read_text(),
})

print(certificate.sid)
