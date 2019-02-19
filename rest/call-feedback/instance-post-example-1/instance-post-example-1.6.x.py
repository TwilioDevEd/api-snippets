# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

feedback = client.calls("CAe03b7cd806070d1f32bdb7f1046a41c0") \
                 .feedback() \
                 .create(quality_score=3,
                         issue=['imperfect-audio'])

print(feedback.date_created)
