# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

get '/sms-quickstart' do
  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(body: "Hello, Mobile Monkey")
  end

  twiml.to_s
end
