# Get twilio-ruby from twilio.com/docs/ruby/install
require 'sinatra'
require 'twilio-ruby'

post '/voice' do
  Twilio::TwiML::Response.new do |r|
    r.gather numDigits: 1 do |g|
      g.say 'For sales, press 1. For support, press 2.'
    end
    r.redirect('/voice')
  end.text
end
