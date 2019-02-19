# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

authorized_app = client \
    .authorized_connect_apps("CN47260e643654388faabe8aaa18ea6756") \
    .fetch()

print(authorized_app.connect_app_homepage_url)
