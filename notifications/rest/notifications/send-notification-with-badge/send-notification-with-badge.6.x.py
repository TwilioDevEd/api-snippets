# NOTE: This example uses the next generation Twilio helper library - for more
# information on how to download and install this version, visit
# https://www.twilio.com/docs/libraries/python
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"
client = Client(account, token)
apn = '{"aps" : { "alert": {"title":"Bob alert","body" :' + \
    '"Bob, you just received a badge"}, "badge" : 1 }}'

notification = client.notify.services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
    .notifications.create(identity="00000001", apn=apn)

print(notification)
