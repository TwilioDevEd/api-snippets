require 'sinatra'
require 'twilio-ruby'

# Handles the POST request from Twilio and generates the TwiML that connects
# agent with the first caller in the Queue
post '/agent/?' do
  response = Twilio::TwiML::Response.new do |r|
    r.Say 'You will now be connected to the first caller in the queue.'
    r.Dial do |d|
      d.Queue 'Queue Demo'
    end
    r.Redirect
  end
  response.text
end
