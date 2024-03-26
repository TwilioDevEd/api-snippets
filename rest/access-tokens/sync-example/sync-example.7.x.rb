require 'twilio-ruby'

# Required for any Twilio Access Token
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
api_key = ENV['TWILIO_API_KEY']
api_secret = ENV['TWILIO_API_KEY_SECRET']
twilio_sync_service = ENV['TWILIO_SYNC_SERVICE_SID']


# Required for Sync
identity = 'user'

# Create Sync grant for our token
grant = Twilio::JWT::AccessToken::SyncGrant.new

# Create a "grant" which enables a client to use Sync as a given user
grant.service_sid = twilio_sync_service

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
