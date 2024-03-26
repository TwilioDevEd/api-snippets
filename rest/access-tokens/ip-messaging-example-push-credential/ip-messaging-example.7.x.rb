require 'twilio-ruby'

# Required for any Twilio Access Token
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
api_key = ENV['TWILIO_API_KEY']
api_secret = ENV['TWILIO_API_KEY_SECRET']

# Required for Chat
service_sid = 'ISxxxxxxxxxxxx'
push_credential_sid = 'CRxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
identity = 'user@example.com'

# Create Chat grant for our token
grant = Twilio::JWT::AccessToken::ChatGrant.new
grant.service_sid = service_sid
grant.push_credential_sid = push_credential_sid

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
