# You can find your Twilio Auth Token here: https://www.twilio.com/console
# Set at runtime as follows:
# $ TWILIO_AUTH_TOKEN="XXXXXXXXXXXXXXXXXXX" ruby index.rb
#
# This will not work unless you export the TWILIO_AUTH_TOKEN environment
# variable.

require 'sinatra'
require 'twilio-ruby'
require 'rack'

# To set up environmental variables, see http://twil.io/secure
use Rack::TwilioWebhookAuthentication, ENV['TWILIO_AUTH_TOKEN'], '/'

post '/' do
  content_type 'text/xml'

  response = Twilio::TwiML::MessagingResponse.new
  response.message(body: 'Store Location: 123 Easy St.')

  response
end
