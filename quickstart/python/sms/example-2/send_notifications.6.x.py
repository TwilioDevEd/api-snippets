# /usr/bin/env python
# Download the twilio-python library from twilio.com/docs/libraries/python
from twilio.rest import Client

# Find these values at https://twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXX"
auth_token = "YYYYYYYYYYYYYYYYYY"
client = Client(account_sid, auth_token)

message = client.api.account.messages.create(
    to="+12316851234",
    from_="+15555555555",
    body="Hello there!",
    media_url=['https://demo.twilio.com/owl.png',
               'https://demo.twilio.com/logo.png'])
