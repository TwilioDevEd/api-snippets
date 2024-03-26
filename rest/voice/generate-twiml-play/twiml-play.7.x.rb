require 'rubygems'
require 'sinatra'
require 'twilio-ruby'

get '/voice' do
  Twilio::TwiML::Response.new do |r|
    r.Say "Hello. It's me."
    r.Play 'https://deved-sample-assets-2691.twil.io/ahoyhoy.mp3'
  end.text
end
