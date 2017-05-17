# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

documents = client.preview.sync \
                  .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
                  .documents \
                  .list()

for document in documents:
    print(document.unique_name)
    print(document.data)
