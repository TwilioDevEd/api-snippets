# Download the Python helper library from twilio.com/docs/python/install
from datetime import datetime

import pytz
from twilio.rest.monitor import TwilioMonitorClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioMonitorClient(account_sid, auth_token)

events = client.events.list(
    source_ip_address="104.14.155.29",
    start_date=datetime(2015, 4, 25, tzinfo=pytz.UTC).isoformat(),
    end_date=datetime(2015, 4, 25, 23, 59, 59, tzinfo=pytz.UTC).isoformat(),
)

for e in events:
    print(e.description)
