# Download the Python helper library from twilio.com/docs/python/install
import os
from datetime import datetime

import pytz
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

events = client.monitor.events.list(
    source_ip_address="104.14.155.29",
    start_date=datetime(2015, 4, 25, tzinfo=pytz.UTC),
    end_date=datetime(2015, 4, 25, 23, 59, 59, tzinfo=pytz.UTC)
)

for e in events:
    print(e.description)
