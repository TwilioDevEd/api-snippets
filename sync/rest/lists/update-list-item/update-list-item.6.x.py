# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

data = {
    'number': "001",
    'name': "Bulbasaur",
    'attack': 50}

list_item = client.sync \
                  .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
                  .sync_lists("MyCollection") \
                  .sync_list_items(0) \
                  .update(data=data)

print(list_item.data)
