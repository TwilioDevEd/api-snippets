from twilio.rest import TwilioRestClient

# put your own credentials here
ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
AUTH_TOKEN = "your_auth_token"

client = TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN)
media_url = "https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg"

client.messages.create(
    to="+15558675310",
    from_="+15017122661",
    body="This is the ship that made the Kessel Run in fourteen parsecs?",
    media_url=media_url
)
