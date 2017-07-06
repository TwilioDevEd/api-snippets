require 'twilio-ruby'

# Required for any Twilio Access Token
account_sid = 'ACxxxxxxxxxxxx'
api_key = 'SKxxxxxxxxxxxx'
api_secret = 'xxxxxxxxxxxxxx'

# Required for Voice
outgoing_application_sid = 'APxxxxxxxxxxxx'
identity = 'user'

# Create Voice grant for our token
grant = Twilio::JWT::VoiceGrant.new
grant.outgoing_application_sid = outgoing_application_sid

# Create an Access Token
token = Twilio::JWT::AccessToken.new(
  account_sid,
  api_key,
  api_secret,
  [grant],
  identity);

# Generate the token
puts token.to_jwt
