# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

get '/sms-quickstart' do
  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.Message(body: "Hello, Mobile Monkey") do |message|
      message.media "https://demo.twilio.com/owl.png"
    end
  end

  twiml.to_s
end
