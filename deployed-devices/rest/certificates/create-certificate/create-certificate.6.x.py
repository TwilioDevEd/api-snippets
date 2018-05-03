# Get the Python helper library from https://twilio.com/docs/libraries/python
from pathlib import Path
from twilio.rest import Client

# Get your Account SID and Auth Token from https://twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Client(account_sid, auth_token)

fleet_sid = 'FLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
fleet_service = client.preview.deployed_devices.fleets(fleet_sid)

certificate = fleet_service.certificates.create({
    'device_sid': 'THXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    'friendly_name': 'Woody',
    'certificate_data': Path('/path/to/certificate.pem').read_text(),
})

print(certificate.sid)
