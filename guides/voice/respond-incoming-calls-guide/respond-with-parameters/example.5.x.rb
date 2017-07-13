# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'sinatra'
require 'twilio-ruby'

post '/voice' do
  city = params['FromCity']

  # Start our TwiML response
  Twilio::TwiML::VoiceResponse.new do |r|
    # Use <Say> to give the caller some instructions
    r.say("Never gonna give you up #{city}.", voice: 'alice')
    r.play(url: 'https://demo.twilio.com/docs/classic.mp3')
  end.to_s
end
