# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "AUTH_TOKEN"
client = Client(account, token)

user = client.chat \
             .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
             .users("USER_SID") \
             .update(role_sid="NEW_ROLE_SID")

print(user.role_sid)
