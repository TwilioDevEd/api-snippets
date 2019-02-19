# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioRestClient(account_sid, auth_token)

feedback = client.calls \
    .get("CAe03b7cd806070d1f32bdb7f1046a41c0") \
    .feedback.create(quality_score=3, issue=['imperfect-audio'])
print(feedback.date_created)
