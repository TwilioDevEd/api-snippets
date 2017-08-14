require 'sinatra'
require 'twilio-ruby'

# Handles the POST request from Twilio and generates the TwiML that puts caller
# in a queue.
post '/caller/?' do
  response = Twilio::TwiML::Response.new do |r|
    # Use <Enqueue> verb to place caller in a <Queue>
    r.Enqueue 'Queue Demo'
  end
  response.text
end
