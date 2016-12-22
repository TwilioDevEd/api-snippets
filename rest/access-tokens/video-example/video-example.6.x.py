from twilio.jwt.access_token import AccessToken, VideoGrant

# required for all twilio access tokens
account_sid = 'ACxxxxxxxxxxxx'
api_key = 'SKxxxxxxxxxxxx'
api_secret = 'xxxxxxxxxxxxxx'

# required for Video grant
configuration_profile_sid = 'VSxxxxxxxxxxxx'
identity = 'user'

# Create access token with credentials
token = AccessToken(account_sid, api_key, api_secret, identity)

# Create a Video grant and add to token
video_grant = VideoGrant(configuration_profile_sid=configuration_profile_sid)
token.add_grant(video_grant)

# Return token info as JSON
print(token.to_jwt())
