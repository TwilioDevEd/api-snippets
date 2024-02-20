# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client
from datetime import date

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

# A list of conference objects with the properties described above
conferences = client.conferences.list(
    status="in-progress", date_created_after=date(2009, 7, 6)
)

for conference in conferences:
    print(conference.sid)
