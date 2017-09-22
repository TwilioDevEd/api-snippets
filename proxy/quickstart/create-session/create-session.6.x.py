# Get the Node helper library from https://twilio.com/docs/libraries/python
from twilio.rest import Client

# Get your Account SID and Auth Token from https://twilio.com/console
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"

client = Client(account, token)

session = client.proxy \
    .services("KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
    .sessions \
    .create(unique_name="MyFirstSession")

print(session.sid)
