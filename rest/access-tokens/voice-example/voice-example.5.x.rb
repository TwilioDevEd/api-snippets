require 'twilio-ruby'

# Required for any Twilio Access Token
account_sid = 'ACxxxxxxxxxxxx'
api_key = 'SKxxxxxxxxxxxx'
api_secret = 'xxxxxxxxxxxxxx'

# Required for Voice
outgoing_application_sid = 'APxxxxxxxxxxxx'
push_credential_sid = 'CRxxxxxxxxxxxx'
identity = 'user'

# Create an Access Token
token = Twilio::JWT::AccessToken.new(
  account_sid,
  api_key,
  api_secret, 
  3600,
  identity);

# Create Voice grant for our token
grant = Twilio::JWT::AccessToken::VoiceGrant.new
grant.outgoing_application_sid = outgoing_application_sid
grant.push_credential_sid = push_credential_sid
token.add_grant(grant)

# Generate the token
puts token.to_jwt
