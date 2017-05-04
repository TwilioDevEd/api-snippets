# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Initialize the client
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "AUTH_TOKEN"
client = Client(account, token)

member = client.chat \
               .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
               .channels("CHANNEL_SID") \
               .members \
               .create("IDENTITY")

print(member)
