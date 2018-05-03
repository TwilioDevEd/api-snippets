require 'twilio-ruby'
require 'sinatra'

post '/sms' do
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message 'The Robots are coming! Head for the hills!'
  end

  content_type 'text/xml'
  twiml.text
end
