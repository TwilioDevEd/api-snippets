# Download the helper library from https://www.twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Client(account_sid, auth_token)

# Provide actions for your assistant: say something and listen for a repsonse.
update_action = {
    'actions': [
        {'say': 'Hi there, I\'m your virtual assistant! How can I help you?'},
        {'listen': True}
    ]
}

# Update the default task to use your new actions.
# Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/assistant/list
client.preview.understand \
    .assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
    .tasks('hello-world') \
    .task_actions().update(update_action)

print("Task actions updated")
