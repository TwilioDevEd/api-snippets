# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioRestClient(account_sid, auth_token)

member = client.members('QU5ef8732a3c49700934481addd5ce1659'
                        ).get("CA386025c9bf5d6052a1d1ea42b4d16662")
print(member.wait_time)
