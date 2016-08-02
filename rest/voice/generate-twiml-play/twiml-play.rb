require 'rubygems'
require 'sinatra'
require 'twilio-ruby'

get '/voice' do
  name = people[params['From']] || 'Monkey'
  Twilio::TwiML::Response.new do |r|
    r.Say "Hello. It's me."
    r.Play 'http://ia600303.us.archive.org/4/items/Wednesdy-tuesdy-ramblinSound/Wednesdy-tuesdyRamblinSound.mp3'
  end.text
end