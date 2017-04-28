# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account = "ACCOUNT_SID"
token = "AUTH_TOKEN"
client = Client(account, token)

# Delete role
response = client.chat \
                  .services("SERVICE_SID") \
                  .roles("ROLE_SID") \
                  .delete()
print(response)
