# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

connect_app = client.connect_apps("CNb989fdd207b04d16aee578018ef5fd93") \
                    .fetch()

print(connect_app.homepage_url)
