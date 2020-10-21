import os
from twilio.rest import Client

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']

fax_sid = "FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

client = Client(account_sid, auth_token)

fax = client.fax.v1.faxes(sid=fax_sid).fetch()

print(fax.sid)
