# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

phone_numbers_sids = ["PN2a0747eba6abf96b7e3c3ff0b4530f6e",
                      "PN557ce644e5ab84fa21cc21112e22c485",
                      "PN2a0747eba6abf96b7e3c3ff0b4530f6e"]

for phone_numbers_sid in phone_numbers_sids:
    phone_number = client.messaging \
                         .services(sid="MG2172dd2db502e20dd981ef0d67850e1a") \
                         .phone_numbers \
                         .create(phone_number_sid=phone_numbers_sid)
    print(phone_number.sid)
