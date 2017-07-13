require 'twilio-ruby'
require 'sinatra'

# Respond to incoming sms with an MMS message
post '/sms' do
  twiml = Twilio::TwiML::MessagingResponse.new do |resp|
    resp.message(body: 'The Robots are coming! Head for the hills!') do |m|
      resp.media 'https://farm8.staticflickr.com/7090/6941316406_80b4d6d50e_z_d.jpg'
    end

  content_type 'text/xml'

  twiml.to_s
end
