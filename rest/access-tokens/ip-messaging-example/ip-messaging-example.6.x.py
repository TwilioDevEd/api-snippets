from twilio.jwt.access_token import AccessToken
from twilio.jwt.access_token.grants import ChatGrant

# required for all twilio access tokens
account_sid = 'ACxxxxxxxxxxxx'
api_key = 'SKxxxxxxxxxxxx'
api_secret = 'xxxxxxxxxxxxxx'

# required for Chat grants
service_sid = 'ISxxxxxxxxxxxx'
identity = 'user@example.com'

# Create access token with credentials
token = AccessToken(account_sid, api_key, api_secret, identity=identity)

# Create an Chat grant and add to token
chat_grant = ChatGrant(service_sid=service_sid)
token.add_grant(chat_grant)

# Return token info as JSON
print(token.to_jwt())
