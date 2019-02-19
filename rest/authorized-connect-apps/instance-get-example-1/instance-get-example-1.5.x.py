# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioRestClient(account_sid, auth_token)

authorized_app = client.authorized_connect_apps.get(
    "CN47260e643654388faabe8aaa18ea6756"
)
print(authorized_app.homepage_url)
