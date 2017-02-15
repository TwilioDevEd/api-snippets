# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client
from datetime import date

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

# A list of recording objects with the properties described above
recordings = client.recordings \
                   .list(date_created=date(2016, 10, 18))

for recording in recordings:
    print(recording.call_sid)
