require 'twilio-ruby'
require 'sinatra'

get '/token' do
  account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
  auth_token = 'your_auth_token'
  capability = Twilio::JWT::ClientCapability.new(account_sid, auth_token)

  # Create an application sid at
  # twilio.com/console/phone-numbers/dev-tools/twiml-apps and use it here
  capability.add_scope(Twilio::JWT::ClientCapability::OutgoingClientScope.new('APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'))
  capability.add_scope(Twilio::JWT::ClientCapability::IncomingClientScope.new(params['ClientName']))
  token = capability.to_jwt

  content_type 'application/jwt'
  token
end

# TODO: post '/voice' do
