# Get twilio-ruby from twilio.com/docs/ruby/install
require 'sinatra'
require 'twilio-ruby'

post '/twiml' do
  # Start our TwiML response
  Twilio::TwiML::Response.new do |r|
    # Use <Say> to give the caller some instructions
    r.Say 'hello world!', voice: 'alice'
  end.text
end
