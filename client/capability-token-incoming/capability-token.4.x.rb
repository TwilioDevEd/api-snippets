require 'twilio-ruby'
require 'sinatra'

get '/token' do
  account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
  auth_token = 'your_auth_token'
  capability = Twilio::Util::Capability.new account_sid, auth_token
  capability.allow_client_incoming 'joey'
  token = capability.generate

  content_type 'application/jwt'
  token
end

# TODO: post '/voice' do
