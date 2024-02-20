# NOTE: This example uses the next generation Twilio helper library - for more
# information on how to download and install this version, visit
# https://www.twilio.com/docs/libraries/python
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account = os.environ['TWILIO_ACCOUNT_SID']
token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account, token)

binding = client.notify \
    .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
    .bindings.create(endpoint="endpoint_id",
                     identity="00000001",
                     binding_type="apn",
                     address="device_token",
                     tag="new user")

print(binding.sid)
