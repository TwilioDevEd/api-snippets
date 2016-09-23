# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
sub_account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
sub_auth_token = "your_auth_token"

sub_account_client = Client(sub_account_sid, sub_auth_token)

# Make a call from your subaccount
sub_account_client.account.calls.create(
    from_='+14158141829',
    to='+16518675309',
    url='http://twimlets.com/message?Message%5B0%5D=Hello%20from%20your%20subaccount'
)
