# Download the Python helper library from twilio.com/docs/libraries/python
from datetime import date
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/console
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = TwilioRestClient(account_sid, auth_token)

# A list of message objects with filtering
messages = client.messages.list(
    to='+15558675310', from_='+15017122661', date_sent=date(2016, 8, 31)
)
