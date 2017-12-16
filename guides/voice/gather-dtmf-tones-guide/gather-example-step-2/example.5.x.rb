# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'sinatra'
require 'twilio-ruby'

post '/voice' do
  Twilio::TwiML::VoiceResponse.new do |r|
    r.gather(numDigits: 1, action: '/gather') do |g|
      g.say('For sales, press 1. For support, press 2.')
    end

    # If the user doesn't enter input, loop
    r.redirect('/voice')
  end.to_s
end

post '/gather' do
  if params['Digits']
    case params['Digits']
    when '1'
      Twilio::TwiML::VoiceResponse.new do |r|
        r.say('You selected sales. Good for you!')
      end.to_s
    when '2'
      Twilio::TwiML::VoiceResponse.new do |r|
        r.say('You need support. We will help!')
      end.to_s
    else
      Twilio::TwiML::VoiceResponse.new do |r|
        r.say('Sorry, I don\'t understand that choice.')
        r.pause
        r.redirect('/voice')
      end.to_s
    end
  else
    Twilio::TwiML::VoiceResponse.new do |r|
      r.redirect('/voice')
    end.to_s
  end
end
