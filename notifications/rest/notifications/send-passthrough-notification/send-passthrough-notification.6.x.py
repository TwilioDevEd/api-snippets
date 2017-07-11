# NOTE: This example uses the next generation Twilio helper library - for more
# information on how to download and install this version, visit
# https://www.twilio.com/docs/libraries/python
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"
client = Client(account, token)

notification = client.notify.services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")\
               .notifications.create(to_binding=[
                 "{\"binding_type\":\"sms\",\"address\":\"+15555555555\"}",
                 "{\"binding_type\":\"facebook-messenger\",\"address\":\"123456789123\"}"
                 ],
                 body="Hello Bob")
                 
print(notification)
