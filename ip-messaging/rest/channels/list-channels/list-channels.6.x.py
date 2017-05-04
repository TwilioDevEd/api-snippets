# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Initialize the client
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "AUTH_TOKEN"
client = Client(account, token)

# List the channels
channels = client.chat \
                 .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
                 .channels \
                 .list()

for c in channels:
    print(c.sid)
