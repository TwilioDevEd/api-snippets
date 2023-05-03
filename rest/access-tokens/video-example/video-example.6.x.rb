require 'twilio-ruby'

# Required for any Twilio Access Token
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
api_key = ENV['TWILIO_API_KEY']
api_secret = ENV['TWILIO_API_KEY_SECRET']

# Required for Video
identity = 'user'

# Create Video grant for our token
video_grant = Twilio::JWT::AccessToken::VideoGrant.new
video_grant.room = 'cool room'

# Create an Access Token
token = Twilio::JWT::AccessToken.new(
  account_sid,
  api_key,
  api_secret,
  [video_grant],
  identity: identity
)

# Generate the token
puts token.to_jwt
