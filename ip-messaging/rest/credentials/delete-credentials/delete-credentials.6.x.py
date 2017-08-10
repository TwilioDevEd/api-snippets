# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Initialize the client
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"
client = Client(account, token)

response = client.chat.credentials("CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
                                   ).delete()

print(response)
