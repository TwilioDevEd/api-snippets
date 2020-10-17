# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
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
