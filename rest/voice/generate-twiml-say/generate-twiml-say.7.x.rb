require 'rubygems'
require 'sinatra'
require 'twilio-ruby'

get '/voice' do
  Twilio::TwiML::Response.new do |r|
    r.Say "Hello. It's me. I've been wondering if after this guide you'd like to meet."
  end.text
end
