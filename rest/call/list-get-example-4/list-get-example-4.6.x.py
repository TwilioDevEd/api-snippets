# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client
from datetime import date

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

# A list of call objects with the properties described above
calls = client.calls.list(
    status="in-progress",
    start_time_after=date(2009, 7, 4),
    start_time_before=date(2009, 7, 6)
)

for call in calls:
    print(call.to)
