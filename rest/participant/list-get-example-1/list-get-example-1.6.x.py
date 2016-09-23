# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

# A list of participant objects with the properties described above
participants = client.conferences('CFbbe4632a3c49700934481addd5ce1659') \
                     .participants \
                     .list()

for participant in participants:
    print(participant.muted)
