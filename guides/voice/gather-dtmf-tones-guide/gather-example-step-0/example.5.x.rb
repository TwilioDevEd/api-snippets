# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'sinatra'
require 'twilio-ruby'

post '/voice' do
  Twilio::TwiML::VoiceResponse.new do |r|
    r.gather numDigits: 1 do |g|
      g.say('For sales, press 1. For support, press 2.')
    end
    r.redirect('/voice')
  end.to_s
end
