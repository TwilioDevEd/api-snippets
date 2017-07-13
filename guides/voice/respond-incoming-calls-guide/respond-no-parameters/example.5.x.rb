# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'sinatra'
require 'twilio-ruby'

post '/twiml' do
  # Start our TwiML response
  Twilio::TwiML::VoiceResponse.new do |r|
    # Use <Say> to give the caller some instructions
    r.say('hello world!', voice: 'alice')
  end.to_s
end
