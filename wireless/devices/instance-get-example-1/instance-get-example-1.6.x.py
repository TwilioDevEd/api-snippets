# Download the **Next-Gen** twilio-python library from:
# twilio.com/docs/libraries/python#installation-nextgen
from twilio.rest import Client

# Your Account SID from www.twilio.com/console
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"  # Your Auth Token from www.twilio.com/console

client = Client(account_sid, auth_token)

device = client.preview \
               .wireless \
               .devices('DEd3f4ec6c85ded1a5f64f10afc067895c') \
               .fetch()

print(device.friendly_name)
