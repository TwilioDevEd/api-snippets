# Download the helper library from https://www.twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

phrases = [
    'Tell me a joke',
    'Tell me a joke',
    'I\'d like to hear a joke',
    'Do you know any good jokes?',
    'Joke',
    'Tell joke',
    'Tell me something funny',
    'Make me laugh',
    'I want to hear a joke',
    'Can I hear a joke?',
    'I like jokes',
    'I\'d like to hear a punny joke'
]

# Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list
# Replace 'UDXXX...' with the SID for the task you just created.
for phrase in phrases:
    sample = client.autopilot \
        .assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
        .tasks('tell-a-joke') \
        .samples \
        .create(language='en-us', tagged_text=phrase)

    print(sample.sid)
