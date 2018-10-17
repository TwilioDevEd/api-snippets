# Download the helper library from https://www.twilio.com/docs/python/install
from twilio.rest import Client


# Your Account Sid and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Client(account_sid, auth_token)

# Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list
query = client.autopilot \
    .assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
    .queries \
    .create(language='en-US', query='Tell me a joke')

print(query.results.get('task'))
