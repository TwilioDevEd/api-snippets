from twilio.jwt.client import ClientCapabilityToken

account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
token = ClientCapabilityToken(account_sid, auth_token).to_jwt(ttl=600)
