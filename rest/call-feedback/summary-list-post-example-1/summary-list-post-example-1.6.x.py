# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

summary = client.calls \
                .feedback_summaries \
                .create("2014-06-01", "2014-06-30",
                        include_subaccounts=True,
                        status_callback="http://www.example.com/feedback")

print(summary.status)
