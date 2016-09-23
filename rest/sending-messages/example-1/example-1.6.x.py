# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

message = client.messages.create(
        "+15558675309",
        body="Jenny please?! I love you <3",
        from_="+14158141829",
        media_url="http://www.example.com/hearts.png")

print(message.sid)
