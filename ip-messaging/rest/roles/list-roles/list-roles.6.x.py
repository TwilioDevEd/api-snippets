# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "AUTH_TOKEN"
client = Client(account, token)

# List the roles
roles = client.chat.services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX").roles.list()
for role in roles:
    print(role.sid)
