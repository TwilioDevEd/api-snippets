from twilio.rest import Client

# put your own credentials here
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"

client = Client(account_sid, auth_token)

client.messages.create(
    to="+15558675310",
    from_="+15017250604",
    body="Open to confirm: http://yourserver.com/confirm?id=1234567890",
    provide_feedback=True
)
