# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Initialize the client
account = "ACCOUNT_SID"
token = "AUTH_TOKEN"
client = Client(account, token)

members = client.chat \
                .services("SERVICE_SID") \
                .channels("CHANNEL_SID") \
                .members \
                .list()

for member in members:
    print(member.sid)
