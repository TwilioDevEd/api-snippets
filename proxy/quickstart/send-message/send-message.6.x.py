# Get the Python helper library from https://twilio.com/docs/libraries/python
from twilio.rest import Client

# Get your Account SID and Auth Token from https://twilio.com/console
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"

client = Client(account, token)

message_interaction = client.proxy \
    .services("KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
    .sessions("KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
    .participants("KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
    .message_interactions.create(body="Reply to this message to chat!")

print(message_interaction.sid)
