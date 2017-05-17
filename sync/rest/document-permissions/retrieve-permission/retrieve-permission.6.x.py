# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

document_permission = client.preview \
                            .sync \
                            .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
                            .documents("ETXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
                            .document_permissions("bob") \
                            .fetch()

print(document_permission.read)
print(document_permission.url)
