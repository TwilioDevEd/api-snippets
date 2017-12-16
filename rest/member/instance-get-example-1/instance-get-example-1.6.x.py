# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

member = client.queues("QU5ef8732a3c49700934481addd5ce1659") \
               .members("CA386025c9bf5d6052a1d1ea42b4d16662") \
               .fetch()

print(member.wait_time)
