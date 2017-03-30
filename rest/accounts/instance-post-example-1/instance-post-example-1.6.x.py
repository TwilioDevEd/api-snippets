# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

account = client.api.v2010.accounts("ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
                .update(status="suspended")

print(account.date_created)
