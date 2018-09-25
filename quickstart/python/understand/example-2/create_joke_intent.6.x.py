# Download the helper library from https://www.twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Client(account_sid, auth_token)

assistant_sid = 'UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
# Create a new intent named 'tell_a_joke'
intent = client.preview.understand \
                       .assistants(assistant_sid) \
                       .intents \
                       .create(unique_name='tell-a-joke')

# Provide actions for the new intent
joke_actions = {
    'actions': [
        {'say': 'I was going to look for my missing watch, but I could never find the time.'}
    ]
}

# Update the tell-a-joke intent to use this 'say' action.
client.preview.understand \
    .assistants(assistant_sid) \
    .intents(intent.sid) \
    .intent_actions().update(joke_actions)

print(intent.sid)
