# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

short_code = client.messaging \
    .services(sid="MG2172dd2db502e20dd981ef0d67850e1a") \
    .short_codes \
    .create(short_code_sid="SC3f94c94562ac88dccf16f8859a1a8b25")

print(short_code.sid)
