# NOTE: This example uses the next generation Twilio helper library - for more
# information on how to download and install this version, visit
# https://www.twilio.com/docs/libraries/python
from twilio.rest import Client
from datetime import datetime

# Your Account Sid and Auth Token from twilio.com/user/account
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"
client = Client(account, token)

bindings = client.notify.services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX").bindings \
    .list(
        tag="new user",
        start_date=datetime.strptime("2015-08-25", "%Y-%m-%d")
    )

for binding in bindings:
    print(binding.sid)
