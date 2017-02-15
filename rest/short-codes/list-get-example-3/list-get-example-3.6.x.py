# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

# A list of short_code objects with the properties described above
short_codes = client.short_codes \
                    .list(short_code="898")

for short_code in short_codes:
    print(short_code.sms_method)
