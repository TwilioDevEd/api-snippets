# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "AUTH_TOKEN"
client = Client(account, token)

# Create role
role = client.chat.services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX").roles.create(
    friendly_name="new_role",
    type="deployment",
    permission=["createChannel", "joinChannel"]
)

print(role.sid)
