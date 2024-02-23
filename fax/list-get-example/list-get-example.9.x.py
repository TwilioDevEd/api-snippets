import os
from twilio.rest import Client

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']

client = Client(account_sid, auth_token)

faxes = client.fax.v1.faxes.list()

for fax in faxes:
    print(fax.media_url)
