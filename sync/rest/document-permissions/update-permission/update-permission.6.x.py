# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client
import json
from datetime import datetime

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

document_permission = client.sync \
                            .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
                            .documents("MyFirstDocument") \
                            .document_permissions("bob") \
                            .update(True, True, False)

print(document_permission.read)  # True
print(document_permission.write)  # True
print(document_permission.manage)  # False
