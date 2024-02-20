#!/usr/bin/env python
# Install the Python helper library from twilio.com/docs/python/install
import os

from twilio.rest import Client

# To set up environmental variables, see http://twil.io/secure
ACCOUNT_SID = os.environ['TWILIO_ACCOUNT_SID']
AUTH_TOKEN = os.environ['TWILIO_AUTH_TOKEN']

client = Client(ACCOUNT_SID, AUTH_TOKEN)
binding = client.notify.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
    .bindings.create(
        # We recommend using a GUID or other anonymized identifier for Identity
        identity='00000001',
        binding_type='sms',
        address='+1651000000000')
print(binding.sid)
