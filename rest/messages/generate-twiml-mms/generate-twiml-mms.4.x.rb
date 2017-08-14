require 'twilio-ruby'
require 'sinatra'

post '/sms' do
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message do |m|
      m.Body 'The Robots are coming! Head for the hills!'
      m.Media 'https://farm8.staticflickr.com/7090/6941316406_80b4d6d50e_z_d.jpg'
    end
  end

  content_type 'text/xml'
  twiml.text
end
