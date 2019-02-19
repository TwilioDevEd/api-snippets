from twilio.jwt.access_token import AccessToken
from twilio.jwt.access_token.grants import VideoGrant

# Required for all Twilio Access Tokens
account_sid = 'ACxxxxxxxxxxxx'
api_key = 'SKxxxxxxxxxxxx'
api_secret = 'xxxxxxxxxxxxxx'

# required for Video grant
identity = 'user'

# Create Access Token with credentials
token = AccessToken(account_sid, api_key, api_secret, identity=identity)

# Create a Video grant and add to token
video_grant = VideoGrant(room='cool room')
token.add_grant(video_grant)

# Return token info as JSON
print(token.to_jwt())
