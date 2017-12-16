# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

participant = client \
    .conferences("CFbbe4632a3c49700934481addd5ce1659") \
    .participants("CA386025c9bf5d6052a1d1ea42b4d16662") \
    .update(hold=True, hold_url="www.myapp.com/hold")

print(participant.hold)
