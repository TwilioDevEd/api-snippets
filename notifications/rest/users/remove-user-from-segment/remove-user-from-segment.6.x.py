#!/usr/bin/env python
# Install the Python helper library from twilio.com/docs/python/install

from twilio.rest import Client

ACCOUNT_SID = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
AUTH_TOKEN = 'your_auth_token'

client = Client(ACCOUNT_SID, AUTH_TOKEN)
client.notify.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
      .users('User0001') \
      .segment_memberships('premium').delete()
