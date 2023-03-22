# Download the helper library from https://www.twilio.com/docs/python/install
import os
from twilio.rest import Client


# Your Account Sid and Auth Token from twilio.com/console
# DANGER! This is insecure. See http://twil.io/secure
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

verification = client.verify \
                     .services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .verifications('+15017122661') \
                     .update(status='approved')

print(verification.to)