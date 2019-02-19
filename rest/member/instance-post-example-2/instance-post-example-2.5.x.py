# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioRestClient(account_sid, auth_token)

member = client.members('QU5ef8732a3c49700934481addd5ce1659').dequeue(
    "http://demo.twilio.com/docs/voice.xml",
    "CA5ef8732a3c49700934481addd5ce1659",
    method="POST"
)
print(member.position)
