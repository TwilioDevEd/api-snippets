require 'twilio-ruby'
require 'sinatra'

get '/token' do
  account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
  auth_token = 'your_auth_token'
  capability = Twilio::Util::Capability.new account_sid, auth_token
  # Create an application sid at
  # twilio.com/console/phone-numbers/dev-tools/twiml-apps and use it here
  capability.allow_client_outgoing 'APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
  capability.allow_client_incoming 'jenny'
  token = capability.generate

  content_type 'application/jwt'
  token
end

# TODO: post '/voice' do
