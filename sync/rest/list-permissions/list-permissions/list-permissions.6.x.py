# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

list_permissions = client.preview \
                         .sync \
                         .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
                         .sync_lists("MyFirstList") \
                         .sync_list_permissions \
                         .list()

for list_permission in list_permissions:
    print(list_permission.unique_name)
    print(list_permission.url)
