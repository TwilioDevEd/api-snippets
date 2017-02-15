# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest.monitor import TwilioMonitorClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioMonitorClient(account_sid, auth_token)

events = client.events.list(
    actor_sid="USd0afd67cddff4ec7cb0022771a203cb1",
    resource_sid="PN4aa51b930717ea83c91971b86d99018f",
)

for e in events:
    print(e.description)
