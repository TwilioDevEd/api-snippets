from twilio.rest import Client

# Account SID and Auth Token are found in the console:
# twilio.com/console
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"

client = Client(account, token)

session = client.preview \
    .proxy \
    .services("KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
    .sessions \
    .create(unique_name="MyFirstSession")

print(session.sid)
