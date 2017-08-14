require 'rubygems'
require 'sinatra'
require 'twilio-ruby'

get '/voice' do
  Twilio::TwiML::Response.new do |r|
    r.Say "Hello. It's me.", voice: 'alice', language: 'en-GB'
    r.Play 'http://howtodocs.s3.amazonaws.com/ahoyhoy.mp3'
    r.Gather numDigits: '1', action: '/voice/handle-gather', method: 'get' do |g|
      g.Say 'To speak to a real person, press 1.'
      g.Say 'Press 2 to record a message for a Twilio educator.'
      g.Say 'Press any other key to start over.'
    end
  end.text
end

get '/voice/handle-gather' do
  redirect '/voice' unless %w[1 2].include?(params['Digits'])
  if params['Digits'] == '1'
    response = Twilio::TwiML::Response.new do |r|
      r.Dial '+13105551212'
      r.Say 'The call failed or the remote party hung up. Goodbye.'
    end
  elsif params['Digits'] == '2'
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Record your message after the tone.'
      r.Record maxLength: '30', action: '/voice/handle-record', method: 'get'
    end
  end
  response.text
end

get '/voice/handle-record' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'Listen to your recorded message.'

    # Twilio passes a 'RecordingUrl' parameter with the incoming request
    r.Play params['RecordingUrl']
    r.Say 'Goodbye.'
  end.text
end
