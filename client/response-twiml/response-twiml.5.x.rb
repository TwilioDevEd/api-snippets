require 'twilio-ruby'
require 'sinatra'

post '/voice' do
  twiml = Twilio::TwiML::Response.new do |r|
    r.Say 'Thanks for calling!'
  end

  content_type 'text/xml'
  twiml.text
end

# TODO: get '/token' do
