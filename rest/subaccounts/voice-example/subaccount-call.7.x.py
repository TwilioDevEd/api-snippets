# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
sub_account_sid = os.environ['TWILIO_ACCOUNT_SID']
sub_auth_token = os.environ['TWILIO_AUTH_TOKEN']

sub_account_client = Client(sub_account_sid, sub_auth_token)
url = 'http://twimlets.com/message?' + \
    'Message%5B0%5D=Hello%20from%20your%20subaccount'

# Make a call from your subaccount
sub_account_client.api.account.calls.create(
    from_='+14158141829', to='+16518675310', url=url
)
