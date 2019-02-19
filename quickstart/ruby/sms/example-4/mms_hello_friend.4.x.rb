# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require 'sinatra'

get '/sms-quickstart' do
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message do |m|
      m.Body 'Hello, friend'
      m.Media 'https://demo.twilio.com/owl.png'
    end
  end

  content_type 'text/xml'
  twiml.text
end
