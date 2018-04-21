# Get twilio-ruby from twilio.com/docs/ruby/install
require 'sinatra'
require 'twilio-ruby'

post '/voice' do
  Twilio::TwiML::Response.new do |r|
    r.gather numDigits: 1, action: '/gather' do |g|
      g.say 'For sales, press 1. For support, press 2.'
    end

    # If the user doesn't enter input, loop
    r.redirect('/voice')
  end.text
end

post '/gather' do
  if params['Digits']
    case params['Digits']
    when '1'
      Twilio::TwiML::Response.new do |r|
        r.Say 'You selected sales. Good for you!'
      end.text
    when '2'
      Twilio::TwiML::Response.new do |r|
        r.Say 'You need support. We will help!'
      end.text
    else
      Twilio::TwiML::Response.new do |r|
        r.Say 'Sorry, I don\'t understand that choice.'
        r.Pause
        r.redirect('/voice')
      end.text
    end
  else
    Twilio::TwiML::Response.new do |r|
      r.redirect('/voice')
    end.text
  end
end
