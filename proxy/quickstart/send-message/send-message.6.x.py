from twilio.rest import Client

# Account SID and Auth Token are found in the console:
# twilio.com/console
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"

client = Client(account, token)

message_interaction = client.preview \
    .proxy \
    .services("KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
    .sessions("KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
    .participants("KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
    .message_interactions.create(body="Reply to this message to chat!")

print(message_interaction.sid)
