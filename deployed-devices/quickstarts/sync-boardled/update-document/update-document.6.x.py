# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

new_data = {'led': "ON"}

document = client.sync \
    .services("default") \
    .documents("BoardLED") \
    .update(data=new_data)

print(document.data)
