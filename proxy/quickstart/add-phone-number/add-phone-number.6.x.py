# NOTE: This example uses the next generation Twilio helper library - for more
# information on how to download and install this version, visit
# https://www.twilio.com/docs/libraries/python
from twilio.rest import Client

# Account SID and Auth Token are found in the console:
# twilio.com/console
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"

client = Client(account, token)

phone_number = client.preview \
    .proxy \
    .services("KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
    .phone_numbers \
    .create(sid="PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")

print(phone_number.sid)
