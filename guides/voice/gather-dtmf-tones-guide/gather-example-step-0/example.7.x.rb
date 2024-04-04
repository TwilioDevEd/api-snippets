# Get twilio-ruby from twilio.com/docs/ruby/install
require 'sinatra'
require 'twilio-ruby'

post '/voice' do
  Twilio::TwiML::VoiceResponse.new do |r|
    r.gather numDigits: 1 do |g|
      g.say(message: 'For sales, press 1. For support, press 2.')
    end
    r.redirect('/voice')
  end.to_s
end
