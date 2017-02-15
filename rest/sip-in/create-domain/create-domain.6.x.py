# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

domain = client.sip \
        .domains \
        .create("dunder-mifflin-scranton.sip.twilio.com",
                friendly_name="Scranton Office",
                voice_url="https://dundermifflin.example.com/twilio/app.php")

print(domain.sid)
