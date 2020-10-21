import os
from twilio.jwt.client import ClientCapabilityToken

# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
token = ClientCapabilityToken(account_sid, auth_token).to_jwt(ttl=600)
