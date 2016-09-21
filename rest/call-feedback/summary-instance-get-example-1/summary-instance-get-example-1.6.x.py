# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

summary = client.calls \
                .feedback_summaries("FSa346467ca321c71dbd5e12f627deb854") \
                .fetch()

print(summary.date_created)
