import os
from twilio.rest import Client

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']

client = Client(account_sid, auth_token)

fax = client.fax.v1.faxes.create(
    from_="+15017122661",
    to="+15558675310",
    media_url="https://www.twilio.com/docs/documents/25/justthefaxmaam.pdf"
)

print(fax.sid)
