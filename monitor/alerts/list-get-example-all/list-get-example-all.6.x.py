# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACCOUNT_SID"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

# A list of alert objects with the properties described above
alerts = client.monitor.alerts.list()

for alert in alerts:
    print(alert.sid)
