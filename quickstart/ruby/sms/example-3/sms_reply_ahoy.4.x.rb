# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require 'sinatra'

get '/sms-quickstart' do
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message 'Ahoy! Thanks so much for your message.'
  end

  content_type 'text/xml'
  twiml.text
end
