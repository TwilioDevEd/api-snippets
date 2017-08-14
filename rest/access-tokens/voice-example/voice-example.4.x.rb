require 'twilio-ruby'

# Required for any Twilio Access Token
account_sid = 'ACxxxxxxxxxxxx'
api_key = 'SKxxxxxxxxxxxx'
api_secret = 'xxxxxxxxxxxxxx'

# Required for Voice
outgoing_application_sid = 'APxxxxxxxxxxxx'
identity = 'user'

# Create an Access Token
token = Twilio::Util::AccessToken.new(
  account_sid,
  api_key,
  api_secret,
  3600,
  identity
)

# Create Voice grant for our token
grant = Twilio::Util::AccessToken::VoiceGrant.new
grant.outgoing_application_sid = outgoing_application_sid
token.add_grant(grant)

# Generate the token
puts token.to_jwt
