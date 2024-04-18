# Get twilio-ruby from twilio.com/docs/ruby/install
require 'sinatra'
require 'twilio-ruby'

post '/voice' do
  Twilio::TwiML::VoiceResponse.new do |r|
    r.gather(numDigits: 1, action: '/gather') do |g|
      g.say(message: 'For sales, press 1. For support, press 2.')
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
        r.say(message: 'You selected sales. Good for you!')
      end.to_s
    when '2'
      Twilio::TwiML::VoiceResponse.new do |r|
        r.say(message: 'You need support. We will help!')
      end.to_s
    else
      Twilio::TwiML::VoiceResponse.new do |r|
        r.say(message: 'Sorry, I don\'t understand that choice.')
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
