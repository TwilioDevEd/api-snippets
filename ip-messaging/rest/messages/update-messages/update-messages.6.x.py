# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "AUTH_TOKEN"
client = Client(account, token)

message = client.chat \
                .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
                .channels("CHANNEL_SID") \
                .messages("MESSAGE_SID") \
                .update(body="MESSAGE")

print(message.body)
