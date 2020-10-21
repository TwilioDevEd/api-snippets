# /usr/bin/env python
# Download the twilio-python library from twilio.com/docs/libraries/python
import os
from twilio.rest import Client

# Find these values at https://twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = "YYYYYYYYYYYYYYYYYY"
client = Client(account_sid, auth_token)

message = client.api.account.messages.create(
    to="+12316851234",
    from_="+15555555555",
    body="Hello there!",
    media_url=['https://demo.twilio.com/owl.png',
               'https://demo.twilio.com/logo.png'])
