# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client
import json
from datetime import datetime

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

map_permission = client.preview \
                       .sync \
                       .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
                       .sync_maps("Players") \
                       .sync_map_permissions("bob") \
                       .update(True, True, False)

print(map_permission.read) # True
print(map_permission.write) # True
print(map_permission.manage) # False
