# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest.monitor import TwilioMonitorClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACda6f132a3c49700934481addd5ce1659"
auth_token  = "{{ auth_token }}"
client = TwilioMonitorClient(account_sid, auth_token)

# A list of alert objects with the properties described above
alerts = client.alerts.list()

for alert in alerts:
    print alert.sid
