# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'twilio-ruby'
require 'sinatra'

set :port, 8080

post '/enqueue_call' do
  Twilio::TwiML::Response.new do |r|
    r.Enqueue workflowSid: 'WW0123456789abcdef0123456789abcdef'
  end.text
end
