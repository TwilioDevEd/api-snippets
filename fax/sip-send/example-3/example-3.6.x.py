# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "AC850685e1d9b8c09dae0b938923dc0d42"
# To set up environmental variables, see http://twil.io/secure
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

fax = client.fax.v1.faxes.create(
    from_="Jack",
    to="sip:kate@example.com?hatchkey=4815162342;transport=TCP",
    media_url="https://www.twilio.com/docs/documents/25/justthefaxmaam.pdf"
)

print(fax.sid)
