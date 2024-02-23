# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
api_key_sid = os.environ['TWILIO_API_KEY']
api_key_secret = os.environ['TWILIO_API_KEY_SECRET']
client = Client(api_key_sid, api_key_secret)

hooks = client.video\
                    .composition_hooks\
                    .list(enabled=True)

for hook in hooks:
    print('Read Composition Hook with SID=%s' % (hook.sid))
