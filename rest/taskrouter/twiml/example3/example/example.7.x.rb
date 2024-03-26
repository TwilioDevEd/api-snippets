# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'
require 'sinatra'

set :port, 8080

post '/enqueue_call' do
  attributes = '{"account_number":"12345abcdef"}'

  Twilio::TwiML::Response.new do |r|
    r.Enqueue workflowSid: 'WW0123456789abcdef0123456789abcdef' do |e|
      e.Task attributes, priority: 5, timeout: 200
    end
  end.text
end
