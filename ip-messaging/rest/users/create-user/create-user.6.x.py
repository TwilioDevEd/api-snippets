# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"
client = Client(account, token)

user = client.chat.services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX").users.create(
    identity="IDENTITY"
)

print(user.identity)
