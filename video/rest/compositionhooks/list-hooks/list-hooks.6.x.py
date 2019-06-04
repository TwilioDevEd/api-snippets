# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
api_key_sid = 'SKXXXX'
api_key_secret = 'your_api_key_secret'
client = Client(api_key_sid, api_key_secret)

hooks = client.video\
                    .compositionHooks\
                    .list(enabled=True)

for hook in hooks:
    print('Read Composition Hook with SID=%s' % (hook.sid))
