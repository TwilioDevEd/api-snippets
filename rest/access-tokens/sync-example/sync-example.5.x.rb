require 'twilio-ruby'

# Required for any Twilio Access Token
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
api_key = ENV['TWILIO_API_KEY']
api_secret = ENV['TWILIO_API_KEY_SECRET']

# Required for Sync
outgoing_application_sid = 'APxxxxxxxxxxxx'
identity = 'user'

# Create Sync grant for our token
grant = Twilio::JWT::AccessToken::SyncGrant.new

# Optional: add to allow incoming calls
grant.incoming_allow = true

# Create an Access Token
token = Twilio::JWT::AccessToken.new(
  account_sid,
  api_key,
  api_secret,
  [grant],
  identity: identity
)

# Generate the token
puts token.to_jwt
