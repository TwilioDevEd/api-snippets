# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client
from datetime import date

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

# A list of notification objects with the properties described above
notifications = client.notifications \
                      .list(message_date_after=date(2009, 7, 6), log="1")

for notification in notifications:
    print(notification.request_url)
