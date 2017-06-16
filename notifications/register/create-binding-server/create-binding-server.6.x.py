#!/usr/bin/env python
# Install the Python helper library from twilio.com/docs/python/install

from twilio.rest import Client

ACCOUNT_SID = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
AUTH_TOKEN = 'your_auth_token'


client = Client(ACCOUNT_SID, AUTH_TOKEN)
binding = client.notify.v1.services(sid='ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
    .bindings.create(
        endpoint='XXXXXXXXXXXXXXX',
        identity='00000001',  # We recommend using a GUID or other anonymized identifier for Identity.
        binding_type='gcm',
        address='gcm_device_token',
        tag=['premium', 'new user']
    )
print(binding.sid)
