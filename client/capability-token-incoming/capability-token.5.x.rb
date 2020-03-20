require 'twilio-ruby'
require 'sinatra'

get '/token' do
  account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
  auth_token = 'your_auth_token'
  capability = Twilio::JWT::ClientCapability.new(account_sid, auth_token)

  capability.add_scope(Twilio::JWT::ClientCapability::IncomingClientScope.new('joey'))
  token = capability.to_jwt

  content_type 'application/jwt'
  token
end

# TODO: post '/voice' do
