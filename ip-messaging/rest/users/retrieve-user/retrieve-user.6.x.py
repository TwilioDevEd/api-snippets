# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account = "ACCOUNT_SID"
token = "AUTH_TOKEN"
client = Client(account, token)

user = client.chat \
             .services("SERVICE_SID") \
             .users("USER_SID") \
             .fetch()

print(user.identity)
