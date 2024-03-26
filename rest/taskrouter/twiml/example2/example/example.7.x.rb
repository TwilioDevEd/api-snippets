# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'
require 'sinatra'

set :port, 8080

post '/enqueue_call' do

  attributes = '{"account_number": "12345abcdef"}'

  Twilio::TwiML::VoiceResponse.new do |response|
    response.enqueue(workflowSid: 'WW0123456789abcdef0123456789abcdef') do |e|
      e.task(attributes)
    end
  end.to_s
end
