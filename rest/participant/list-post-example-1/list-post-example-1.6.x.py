# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token  = "your_auth_token"
client = Client(account_sid, auth_token)

fromNumber = "+18180021216"
toNumber = "+15624421212"
participant = client \
    .conferences("AgentConf12") \
    .participants \
    .create(fromNumber, toNumber)

print(participant.call_sid)
