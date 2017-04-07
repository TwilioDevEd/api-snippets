from twilio.rest import Client

# put your own credentials here
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"

client = Client(account_sid, auth_token)

client.messages.create(
    to="+15558675309",
    from_="+15017250604",
    body="This is the ship that made the Kessel Run in fourteen parsecs?")
