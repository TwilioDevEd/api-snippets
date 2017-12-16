# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"

client = Client(account_sid, auth_token)

# A list of record objects with the properties described above
records = client.usage.records.daily.list(
    category="calls-inbound", start_date="2012-09-01", end_date="2012-09-30"
)
