require 'twilio-ruby'

# Required for any Twilio Access Token
account_sid = 'ACxxxxxxxxxxxx'
api_key = 'SKxxxxxxxxxxxx'
api_secret = 'xxxxxxxxxxxxxx'

# Required for IP Messaging
service_sid = 'ISxxxxxxxxxxxx'
identity = 'user@example.com'

# Create an Access Token
token = Twilio::Util::AccessToken.new account_sid, api_key, api_secret,
                                      3600, identity

# Create IP Messaging grant for our token
grant = Twilio::Util::AccessToken::IpMessagingGrant.new
grant.service_sid = service_sid
token.add_grant grant

# Generate the token
puts token.to_jwt
