from twilio.access_token import AccessToken, VoiceGrant

# required for all twilio access tokens
account_sid = 'ACxxxxxxxxxxxx'
api_key = 'SKxxxxxxxxxxxx'
api_secret = 'xxxxxxxxxxxxxx'

# required for Voice grant
outgoing_application_sid = 'APxxxxxxxxxxxxx'
identity = 'user'

# Create access token with credentials
token = AccessToken(account_sid, api_key, api_secret, identity)

# Create a Voice grant and add to token
voice_grant = VoiceGrant(outgoing_application_sid=outgoing_application_sid)
token.add_grant(voice_grant)

# Return token info as JSON
print(token.to_jwt())
