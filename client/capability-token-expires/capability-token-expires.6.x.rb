capability = Twilio::JWT::ClientCapability.new(account_sid, auth_token, ttl: 600)
token = capability.to_jwt

puts token
