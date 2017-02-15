require 'twilio-ruby'

# Required for any Twilio Access Token
account_sid = 'ACxxxxxxxxxxxx'
api_key = 'SKxxxxxxxxxxxx'
api_secret = 'xxxxxxxxxxxxxx'

# Required for Video
configuration_profile_sid = 'VSxxxxxxxxxxxx'
identity = 'user'

# Create an Access Token
token = Twilio::Util::AccessToken.new(
  account_sid,
  api_key,
  api_secret, 
  3600,
  identity);

# Create Video grant for our token
grant = Twilio::Util::AccessToken::VideoGrant.new
grant.configuration_profile_sid = configuration_profile_sid
token.add_grant(grant)

# Generate the token
puts token.to_jwt
