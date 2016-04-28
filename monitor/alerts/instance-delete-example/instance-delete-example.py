# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest.monitor import TwilioMonitorClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACda6f132a3c49700934481addd5ce1659"
auth_token  = "{{ auth_token }}"
client = TwilioMonitorClient(account_sid, auth_token)

client.alerts.delete("NO5a7a84730f529f0a76b3e30c01315d1a")