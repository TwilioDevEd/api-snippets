import os
from twilio.jwt.access_token import AccessToken
from twilio.jwt.access_token.grants import VideoGrant

# Required for all Twilio Access Tokens
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
api_key = os.environ['TWILIO_API_KEY']
api_secret = os.environ['TWILIO_API_KEY_SECRET']

# required for Video grant
identity = 'user'

# Create Access Token with credentials
token = AccessToken(account_sid, api_key, api_secret, identity=identity)

# Create a Video grant and add to token
video_grant = VideoGrant(room='cool room')
token.add_grant(video_grant)

# Return token info as JSON
print(token.to_jwt())
