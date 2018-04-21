# Get twilio-ruby from twilio.com/docs/ruby/install
require 'sinatra'
require 'twilio-ruby'

post '/record' do
  Twilio::TwiML::Response.new do |r|
    # Use <Say> to give the caller some instructions
    r.Say 'Hello. Please leave a message after the beep.'

    # Use <Record> to record the caller's message
    r.Record

    # End the call with <Hangup>
    r.Hangup
  end.text
end
