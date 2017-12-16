# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"

client = Client(account_sid, auth_token)

trigger = client.usage.triggers.create(
    trigger_value="1000",
    usage_category="sms",
    callback_url="http://www.example.com/"
)

print(trigger.sid)
