# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = os.environ['TWILIO_ACCOUNT_SID']
# To set up environmental variables, see http://twil.io/secure
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

event = client.monitor.events("AE21f24380625e4aa4abec76e39b14458d").fetch()
print(event.description)
