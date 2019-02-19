# Download the Python helper library from twilio.com/docs/python/install
from datetime import datetime
import pytz
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACCOUNT_SID"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

# A list of alert objects with the properties described above
alerts = client.monitor.alerts.list(
    start_date=datetime(2015, 4, 1, tzinfo=pytz.UTC),
    end_date=datetime(2015, 4, 30, 23, 59, 59, tzinfo=pytz.UTC),
    log_level="warning"
)
for alert in alerts:
    print(alert.alert_text)
