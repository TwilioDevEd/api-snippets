# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

map_permission = client.sync \
    .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
    .sync_maps("Players") \
    .sync_map_permissions("bob") \
    .fetch()

print(map_permission.identity)
print(map_permission.url)
