# Get twilio-ruby from twilio.com/docs/ruby/install
require 'sinatra'
require 'twilio-ruby'

post '/voice' do
  city = params['FromCity']

  # Start our TwiML response
  Twilio::TwiML::Response.new do |r|
    # Use <Say> to give the caller some instructions
    r.Say "Never gonna give you up #{city}.", voice: 'alice'
    r.Play 'https://demo.twilio.com/docs/classic.mp3'
  end.text
end
