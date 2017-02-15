# Download the **Next-Gen** twilio-python library from:
# twilio.com/docs/libraries/python#installation-nextgen
from twilio.rest import Client

# Your Account SID from www.twilio.com/console
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"  # Your Auth Token from www.twilio.com/console

client = Client(account_sid, auth_token)

command = client.preview \
                .wireless \
                .commands('DCcb6aa7c620874dd98ba6c9c4108d0ed0') \
                .fetch()

print(command.command)
