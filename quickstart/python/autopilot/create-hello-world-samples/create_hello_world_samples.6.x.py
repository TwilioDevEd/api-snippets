# Download the helper library from https://www.twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

phrases = [
    'hello',
    'hi',
    'Hello',
    'Hi there'
]

# Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list
for phrase in phrases:
    sample = client.autopilot \
        .assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
        .tasks('hello-world') \
        .samples \
        .create(language='en-us', tagged_text=phrase)

    print(sample.sid)
