# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
recording_sid="RE557ce644e5ab84fa21cc21112e22c485" 

client = Client(account_sid, auth_token)

client.api.v2010.accounts(sid=account_sid).recordings(sid=recording_sid).fetch()
