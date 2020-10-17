import os
from twilio.rest import Client

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']

client = Client(account_sid, auth_token)

client.messages.create(
    to="+15558675310",
    from_="+15017122661",
    body="McAvoy or Stewart? These timelines can get so confusing.",
    status_callback="http://requestb.in/1234abcd"
)
