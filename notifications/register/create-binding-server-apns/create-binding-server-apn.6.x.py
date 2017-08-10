#!/usr/bin/env python
# Install the Python helper library from twilio.com/docs/python/install

from twilio.rest import Client

ACCOUNT_SID = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
AUTH_TOKEN = 'your_auth_token'

client = Client(ACCOUNT_SID, AUTH_TOKEN)
binding = client.notify.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')\
            .bindings.create(endpoint='endpoint_id',
                             identity='00000001',
                             binding_type='apn',
                             address='apn_device_token',
                             tag=['preferred device', 'new user'])

print(binding.sid)
