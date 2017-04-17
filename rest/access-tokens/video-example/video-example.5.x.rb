require 'twilio-ruby'

# Required for any Twilio Access Token
account_sid = 'ACxxxxxxxxxxxx'
api_key = 'SKxxxxxxxxxxxx'
api_secret = 'xxxxxxxxxxxxxx'

# Required for Video
identity = 'user'

# Create an Access Token
token = Twilio::JWT::AccessToken.new(
  account_sid,
  api_key,
  api_secret, 
  3600,
  identity);

# Create Video grant for our token
grant = Twilio::JWT::AccessToken::VideoGrant.new
grant.room = 'cool room'
token.add_grant(grant)

# Generate the token
puts token.to_jwt
