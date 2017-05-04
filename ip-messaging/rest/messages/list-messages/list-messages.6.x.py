# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Initialize the client
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"
client = Client(account, token)

messages = client.chat \
                 .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
                 .channels("CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
                 .messages \
                 .list()

for message in messages:
    print(message.body)
