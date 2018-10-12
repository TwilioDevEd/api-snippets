# Download the helper library from https://www.twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Client(account_sid, auth_token)

# Create a new task named 'tell_a_joke'
# Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list
task = client.preview.understand \
                       .assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .tasks \
                       .create(unique_name='tell-a-joke')

# Provide actions for the new task
joke_actions = {
    'actions': [
        {'say': 'I was going to look for my missing watch, but I could never find the time.'}
    ]
}

# Update the tell-a-joke task to use this 'say' action.
client.preview.understand \
    .assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
    .tasks(task.sid) \
    .task_actions().update(joke_actions)

print(intent.sid)
