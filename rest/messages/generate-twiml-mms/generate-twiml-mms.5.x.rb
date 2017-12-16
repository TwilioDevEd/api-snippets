require 'twilio-ruby'
require 'sinatra'

# Respond to incoming sms with an MMS message
post '/sms' do
  twiml = Twilio::TwiML::MessagingResponse.new do |resp|
    media = 'https://farm8.staticflickr.com/7090/6941316406_80b4d6d50e_z_d.jpg'
    resp.message body: 'The Robots are coming! Head for the hills!' do |_m|
      resp.media media
    end
  end

  content_type 'text/xml'
  twiml.to_s
end
