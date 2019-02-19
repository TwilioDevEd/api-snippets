require 'rubygems'
require 'sinatra'
require 'twilio-ruby'

voice_endpoint = '/voice'
voice_gather = '/voice/handle-gather'
voice_record = '/voice/handle-record'

get voice_endpoint do
  Twilio::TwiML::Response.new do |r|
    r.Say "Hello. It's me.", voice: 'alice', language: 'en-GB'
    r.Play 'http://howtodocs.s3.amazonaws.com/ahoyhoy.mp3'
    r.Gather numDigits: '1', action: voice_gather, method: 'get' do |g|
      g.Say 'To speak to a real person, press 1.'
      g.Say 'Press 2 to record a message for a Twilio educator.'
      g.Say 'Press any other key to start over.'
    end
  end.text
end

get voice_gather do
  redirect voice_endpoint unless %w[1 2].include?(params['Digits'])
  if params['Digits'] == '1'
    response = Twilio::TwiML::Response.new do |r|
      r.Dial '+13105551212'
      r.Say 'The call failed or the remote party hung up. Goodbye.'
    end
  elsif params['Digits'] == '2'
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Record your message after the tone.'
      r.Record maxLength: '30', action: voice_record, method: 'get'
    end
  end
  response.text
end

get voice_record do
  Twilio::TwiML::Response.new do |r|
    r.Say 'Listen to your recorded message.'

    # Twilio passes a 'RecordingUrl' parameter with the incoming request
    r.Play params['RecordingUrl']
    r.Say 'Goodbye.'
  end.text
end
