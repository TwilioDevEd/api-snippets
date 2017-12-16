# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'sinatra'
require 'twilio-ruby'

post '/record' do
  Twilio::TwiML::VoiceResponse.new do |r|
    # Use <Say> to give the caller some instructions
    r.say('Hello. Please leave a message after the beep.')

    # Use <Record> to record the caller's message
    r.record

    # End the call with <Hangup>
    r.hangup
  end.to_s
end
