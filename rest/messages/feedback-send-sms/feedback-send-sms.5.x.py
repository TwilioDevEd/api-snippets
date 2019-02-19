from twilio.rest import TwilioRestClient

# put your own credentials here
ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
AUTH_TOKEN = "your_auth_token"

client = TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN)

# TODO: Confirm passing provide_feedback works
client.messages.create(
    to="+15558675310",
    from_="+15017122661",
    body="Open to confirm: http://yourserver.com/confirm?id=1234567890",
    provide_feedback=True
)
