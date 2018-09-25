require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :secret => 'can-be-anything-but-keep-a-secret'

post '/sms' do
  session["counter"] ||= 0
  sms_count = session["counter"]
  if sms_count == 0
    message = "Hello, thanks for the new message."
  else
    message = "Hello, thanks for message number #{sms_count + 1}"
  end
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message message
  end
  session["counter"] += 1

  content_type 'text/xml'
  twiml.text
end
