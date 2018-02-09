from twilio.rest import TwilioRestClient

# put your own credentials here
ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
AUTH_TOKEN = "your_auth_token"

client = TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN)

client.messages.create(
    to="+15558675310",
    from_="+15017122661",
    body="This is the ship that made the Kessel Run in fourteen parsecs?",
)
