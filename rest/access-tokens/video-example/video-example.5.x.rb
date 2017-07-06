require 'twilio-ruby'

# Required for any Twilio Access Token
account_sid = 'ACxxxxxxxxxxxx'
api_key = 'SKxxxxxxxxxxxx'
api_secret = 'xxxxxxxxxxxxxx'

# Required for Video
identity = 'user'

# Create Video grant for our token
video_grant = Twilio::JWT::VideoGrant.new
video_grant.room = 'cool room'

# Create an Access Token
token = Twilio::JWT::AccessToken.new(
  account_sid,
  api_key,
  api_secret,
  [video_grant],
  identity);

# Generate the token
puts token.to_jwt
