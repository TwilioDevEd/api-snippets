require 'twilio-ruby'

# Required for any Twilio Access Token
account_sid = 'ACxxxxxxxxxxxx'
api_key = 'SKxxxxxxxxxxxx'
api_secret = 'xxxxxxxxxxxxxx'

# Required for Chat
service_sid = 'ISxxxxxxxxxxxx'
identity = 'user@example.com'

# Create Chat grant for our token
grant = Twilio::JWT::AccessToken::ChatGrant.new
grant.service_sid = service_sid

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
