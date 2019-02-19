require 'twilio-ruby'
require 'sinatra'

post '/sms' do
  puts "Message: #{params['Body']}!"

  twiml = Twilio::TwiML::Response.new do |r|
    r.Say 'Hello! You will get an SMS message soon.'
    r.Sms 'This is the ship that made the Kessel Run in fourteen parsecs?'
  end
  twiml.text
end
