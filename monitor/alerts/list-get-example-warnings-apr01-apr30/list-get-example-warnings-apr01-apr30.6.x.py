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

# A list of alert objects with the properties described above
alerts = client.monitor.alerts.list(
    start_date=datetime(2015, 4, 1, tzinfo=pytz.UTC),
    end_date=datetime(2015, 4, 30, 23, 59, 59, tzinfo=pytz.UTC),
    log_level="warning"
)
for alert in alerts:
    print(alert.alert_text)
