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
