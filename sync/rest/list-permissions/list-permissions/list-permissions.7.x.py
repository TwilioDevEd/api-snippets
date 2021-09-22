# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

list_permissions = client.sync \
    .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
    .sync_lists("MyFirstList") \
    .sync_list_permissions \
    .list()

for list_permission in list_permissions:
    print(list_permission.identity)
    print(list_permission.url)
