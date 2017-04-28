# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account = "ACCOUNT_SID"
token = "AUTH_TOKEN"
client = Client(account, token)

message = client.chat \
                .services("SERVICE_SID") \
                .channels("CHANNEL_SID") \
                .messages \
                .create(body="MESSAGE")

print(message.body)
