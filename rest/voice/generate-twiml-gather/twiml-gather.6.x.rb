require 'rubygems'
require 'sinatra'
require 'twilio-ruby'

voice_gather = '/voice/handle-gather'

get '/voice' do
  Twilio::TwiML::Response.new do |r|
    r.Say "Hello. It's me.", voice: 'alice', language: 'en-GB'
    r.Play 'https://deved-sample-assets-2691.twil.io/ahoyhoy.mp3'
    r.Gather numDigits: '1', action: voice_gather, method: 'get' do |g|
      g.Say 'To speak to a real person, press 1.'
      g.Say 'Press 2 to record a message for a Twilio educator.'
      g.Say 'Press any other key to start over.'
    end
  end.text
end
