# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = os.environ['TWILIO_ACCOUNT_SID']
# To set up environmental variables, see http://twil.io/secure
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

fax = client.fax.v1.faxes.create(
    from_="Jack",
    to="sip:kate@example.com",
    media_url="https://www.twilio.com/docs/documents/25/justthefaxmaam.pdf"
)

print(fax.sid)
