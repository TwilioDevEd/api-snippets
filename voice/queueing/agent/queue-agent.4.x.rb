require 'sinatra'
require 'twilio-ruby'

# Handles the POST request from Twilio and generates the TwiML that connects
# agent with the first caller in the Queue
post '/agent/?' do
  response = Twilio::TwiML::Response.new do |r|
    r.Dial do |d|
      d.Queue 'Queue Demo'
    end
  end
  response.text
end
