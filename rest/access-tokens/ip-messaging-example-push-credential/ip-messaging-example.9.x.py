import os
from twilio.jwt.access_token import AccessToken
from twilio.jwt.access_token.grants import ChatGrant

# required for all twilio access tokens
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
api_key = os.environ['TWILIO_API_KEY']
api_secret = os.environ['TWILIO_API_KEY_SECRET']

# required for Chat grants
service_sid = 'ISxxxxxxxxxxxx'
push_credential_sid = 'CRxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
identity = 'user@example.com'

# Create access token with credentials
token = AccessToken(account_sid, api_key, api_secret, identity=identity)

# Create an Chat grant and add to token
chat_grant = ChatGrant(service_sid=service_sid, push_credential_sid=push_credential_sid)
token.add_grant(chat_grant)

# Return token info as JSON
print(token.to_jwt())
