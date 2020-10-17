# NOTE: This example uses the next generation Twilio helper library - for more
# information on how to download and install this version, visit
# https://www.twilio.com/docs/libraries/python
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account = os.environ['TWILIO_ACCOUNT_SID']
token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account, token)

credential = client.notify.credentials.create(
    type="apn",
    friendly_name="MyAPNCredential",
    certificate="cert.pem_content",
    private_key="key.pem_content",
    sandbox="true"
)

print(credential.friendly_name)
