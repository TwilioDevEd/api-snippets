# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

did_delete = client.video \
                   .recordings("RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
                   .delete()

print(did_delete)
