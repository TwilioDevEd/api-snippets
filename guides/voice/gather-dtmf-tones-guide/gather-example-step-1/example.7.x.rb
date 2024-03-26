# Get twilio-ruby from twilio.com/docs/ruby/install
require 'sinatra'
require 'twilio-ruby'

post '/voice' do
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
        r.gather(numDigits: 1) do |g|
          g.say(message: 'For sales, press 1. For support, press 2.')
        end
        r.redirect('/voice')
      end.to_s
    end
  else
    Twilio::TwiML::VoiceResponse.new do |r|
      r.gather(numDigits: 1) do |g|
        g.say(message: 'For sales, press 1. For support, press 2.')
      end
      r.redirect('/voice')
    end.to_s
  end
end
