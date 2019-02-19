# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client
from math import ceil
import datetime

# Your Account Sid and Auth Token from twilio.com/user/account
sub_account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
sub_auth_token = "your_auth_token"
sub_account_client = Client(sub_account_sid, sub_auth_token)
sub_account = sub_account_client.api.account

# Place to store the billable usage
time_to_bill = 0

# 30 days ago
date = datetime.datetime.now() + datetime.timedelta(-30)

calls = sub_account.calls.list(start_time=date.strftime('%Y-%m-%d'))

for call in calls:
    time_to_bill += ceil(int(call.duration) / 60)

print("Account {0} used {1} minutes.".format(sub_account_sid, time_to_bill))
