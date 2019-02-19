# /usr/bin/env python
# Download the twilio-python library from twilio.com/docs/libraries/python
from twilio.rest import TwilioRestClient

# Find these values at https://twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"

client = TwilioRestClient(account_sid, auth_token)

client.messages.create(
    to="+12316851234",
    from_="+15555555555",
    body="Hello there!")
