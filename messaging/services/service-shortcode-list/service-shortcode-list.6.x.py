# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

short_codes = client.messaging \
    .services(sid="MG2172dd2db502e20dd981ef0d67850e1a") \
    .short_codes \
    .list()

for short_code in short_codes:
    print(short_code.sid)
