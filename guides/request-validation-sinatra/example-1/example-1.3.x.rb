require 'sinatra'
require 'twilio-ruby'
require 'rack'
require 'dotenv'

Dotenv.load

use Rack::TwilioWebhookAuthentication, ENV['TWILIO_AUTH_TOKEN'], '/'

post '/' do
  content_type 'text/xml'

  response = Twilio::TwiML::Response.new do |r|
    r.Message('Hello World')
  end
  response.to_xml
end
