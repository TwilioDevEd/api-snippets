# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client
import json

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

data = json.dumps({
    'name': "Stephen Curry",
    'level': 31,
    'username': "spicy_curry"
})

map_item = client.sync \
                 .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
                 .sync_maps("Players") \
                 .sync_map_items("steph_curry") \
                 .update(data=data)

print(map_item.data)
