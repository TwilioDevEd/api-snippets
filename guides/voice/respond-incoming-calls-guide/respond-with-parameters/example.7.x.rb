# Get twilio-ruby from twilio.com/docs/ruby/install
require 'sinatra'
require 'twilio-ruby'

post '/voice' do
  city = params['FromCity']

  # Start our TwiML response
  Twilio::TwiML::VoiceResponse.new do |r|
    # Use <Say> to give the caller some instructions
    r.say("Never gonna give you up #{city}.")
    r.play(url: 'https://demo.twilio.com/docs/classic.mp3')
  end.to_s
end
