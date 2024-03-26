# Get twilio-ruby from twilio.com/docs/ruby/install
require 'sinatra'
require 'twilio-ruby'

post '/record' do
  # Start our TwiML response
  Twilio::TwiML::Response.new do |r|
    # Use <Say> to give the caller some instructions
    r.say(message: 'Hello. Please leave a message and I will transcribe it.')

    # Use <Record> to record and transcribe the caller's message
    r.record(transcribe: true, max_length: 30)

    # End the call with <Hangup>
    r.hangup
  end.to_s
end
