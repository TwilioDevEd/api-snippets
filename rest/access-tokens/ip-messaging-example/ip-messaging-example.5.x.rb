require 'twilio-ruby'

# Required for any Twilio Access Token
account_sid = 'ACxxxxxxxxxxxx'
api_key = 'SKxxxxxxxxxxxx'
api_secret = 'xxxxxxxxxxxxxx'

# Required for IP Messaging
service_sid = 'ISxxxxxxxxxxxx'
device_id = 'someiosdevice'
identity = 'user@example.com'
endpoint_id = "HipFlowSlackDockRC:#{identity}:#{device_id}"

# Create IP Messaging grant for our token
grant = Twilio::JWT::AccessToken::IpMessagingGrant.new
grant.service_sid = service_sid
grant.endpoint_id = endpoint_id

# Create an Access Token
token = Twilio::JWT::AccessToken.new(
  account_sid,
  api_key,
  api_secret,
  [grant],
  identity: identity);

# Generate the token
puts token.to_jwt
