# NOTE: This example uses the next generation Twilio helper library - for more
# information on how to download and install this version, visit
# https://www.twilio.com/docs/libraries/python
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
token = "your_auth_token"
client = Client(account, token)

notification = client.notify.services("ISxxx")\
    .notifications.create(identity="00000001",
                          title="Generic loooooooong title for all Bindings",
                          body="This is the body for all Bindings",
                          gcm='{"notification":{"tag":"MyTag"}}',
                          apn='{"aps":{"title":"Short title for Watch."}}')

print(notification)
