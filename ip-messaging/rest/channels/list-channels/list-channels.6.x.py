# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Initialize the client
account = "ACCOUNT_SID"
token = "AUTH_TOKEN"
client = Client(account, token)

# List the channels
channels = client.chat \
                 .services("SERVICE_SID") \
                 .channels \
                 .list()

for c in channels:
    print(c.sid)
