# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

message = client.messages("MM800f449d0399ed014aae2bcc0cc2f2ec") \
                .fetch()

print(message.body.encode('utf-8'))
