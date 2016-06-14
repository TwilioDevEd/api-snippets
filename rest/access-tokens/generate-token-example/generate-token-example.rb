require 'rubygems'  # This line not needed for ruby > 1.8
require 'twilio-ruby'

# You will need your Account Sid and a SigningKey Sid and Secret
# to generate an Access Token for your SDK endpoint to connect to Twilio.
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
signingkey_sid = SID
signingkey_secret = SECRET

token = Twilio::Util::AccessToken.new signingkey_sid, account_sid, signingkey_secret
token.add_endpoint_grant ENDPOINT_ADDRESS
token.enable_nts
puts token.to_jwt
