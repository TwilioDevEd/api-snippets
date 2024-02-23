# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = os.environ['TWILIO_ACCOUNT_SID']
# To set up environmental variables, see http://twil.io/secure
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

events = client.monitor.events.list(
    actor_sid="USd0afd67cddff4ec7cb0022771a203cb1",
    resource_sid="PN4aa51b930717ea83c91971b86d99018f",
)

for e in events:
    print(e.description)
