require 'twilio-ruby'
require 'sinatra'

# Respond to incoming sms with an MMS message
post '/sms' do
  twiml = Twilio::TwiML::Response.new do |resp|
    resp.Message do |m|
      m.Body 'The Robots are coming! Head for the hills!'
      m.Media 'https://farm8.staticflickr.com/7090/6941316406_80b4d6d50e_z_d.jpg'
    end
  end

  content_type 'text/xml'
  twiml.text
end
