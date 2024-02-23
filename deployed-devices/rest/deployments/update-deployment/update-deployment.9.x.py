# Get the Python helper library from https://twilio.com/docs/libraries/python
import os
from twilio.rest import Client

# Get your Account SID and Auth Token from https://twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

fleet_sid = 'FLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
deployment_sid = 'DLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
deployment = client.preview\
                   .deployed_devices\
                   .fleets(fleet_sid)\
                   .deployments(sid=deployment_sid)\
                   .update(friendly_name='My New Device Deployment')

print(deployment.friendly_name)
