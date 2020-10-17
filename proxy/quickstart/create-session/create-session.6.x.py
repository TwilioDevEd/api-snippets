# Get the Python helper library from https://twilio.com/docs/libraries/python
import os
from twilio.rest import Client

# Get your Account SID and Auth Token from https://twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account = os.environ['TWILIO_ACCOUNT_SID']
token = os.environ['TWILIO_AUTH_TOKEN']

client = Client(account, token)

session = client.proxy \
    .services("KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
    .sessions \
    .create(unique_name="MyFirstSession")

print(session.sid)
