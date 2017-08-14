require 'rubygems'
require 'sinatra'
require 'twilio-ruby'

get '/voice' do
  Twilio::TwiML::Response.new do |r|
    r.Say "Hello. It's me."
    r.Play 'http://howtodocs.s3.amazonaws.com/ahoyhoy.mp3'
  end.text
end
