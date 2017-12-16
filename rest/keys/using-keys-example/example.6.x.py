# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
api_key = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
api_secret = "your_api_secret"

client = Client(api_key, api_secret, account_sid)

message = client.messages.create(
    "+15558675310",
    from_='+15017250604',  # twilio number
    body='Never gonna give you up.'
)

print(message.sid)
