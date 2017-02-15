# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest.monitor import TwilioMonitorClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioMonitorClient(account_sid, auth_token)

alert = client.alerts.get("NO5a7a84730f529f0a76b3e30c01315d1a")
print(alert.alert_text)
