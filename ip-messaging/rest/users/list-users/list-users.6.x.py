# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "AUTH_TOKEN"
client = Client(account, token)

# List the users
users = client.chat.services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX").users.list()
for user in users:
    print(user.identity)
