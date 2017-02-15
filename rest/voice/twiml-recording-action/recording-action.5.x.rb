require 'rubygems'
require 'sinatra'
require 'twilio-ruby'

get '/voice/handle-record' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'Listen to your recorded message.'

    # Twilio passes a 'RecordingUrl' parameter with the incoming request
    r.Play params['RecordingUrl']
    r.Say 'Goodbye.'
  end.text
end
