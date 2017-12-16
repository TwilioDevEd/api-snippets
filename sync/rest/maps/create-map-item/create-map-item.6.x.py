# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

data = {'name': "Stephen Curry", 'level': 30, 'username': "spicy_curry"}

map_item = client.sync \
    .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
    .sync_maps("Players") \
    .sync_map_items \
    .create(key="steph_curry",
            data=data,
            ttl=864000)  # expires in 10 days

print(map_item.data)
