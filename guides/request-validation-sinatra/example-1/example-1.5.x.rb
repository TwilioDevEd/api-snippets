# You can find your Twilio Auth Token here: https://www.twilio.com/console
# Set at runtime as follows:
# $ TWILIO_AUTH_TOKEN="XXXXXXXXXXXXXXXXXXX" ruby index.rb
#
# This will not work unless you export the TWILIO_AUTH_TOKEN environment
# variable.

require 'sinatra'
require 'twilio-ruby'

post '/' do
  content_type 'text/xml'

  response = Twilio::TwiML::MessagingResponse.new
  response.message('Hello World')

  response
end
