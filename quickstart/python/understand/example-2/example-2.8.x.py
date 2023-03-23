# Download the helper library from https://www.twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

# Provide actions for the new task
joke_actions = {
    'actions': [
        {'say': 'I was going to look for my missing watch, but I could never find the time.'}
    ]
}

# Create a new task named 'tell_a_joke'
# Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list
task = client.preview.understand \
                       .assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .tasks \
                       .create(
                           unique_name='tell-a-joke',
                           actions=joke_actions)

print(task.sid)
