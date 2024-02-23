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

binding1 = '{"binding_type":"sms","address":"+15555555555"}'
binding2 = '{"binding_type":' + \
    '"facebook-messenger","address":"123456789123"}'

notification = client.notify.services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
    .notifications.create(to_binding=[binding1, binding2], body="Hello Bob")

print(notification)
