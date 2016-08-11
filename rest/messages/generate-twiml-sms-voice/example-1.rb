require 'rubygems' # not necessary with ruby 1.9 but included for completeness 
require 'twilio-ruby'
require 'sinatra'

post '/sms' do
  puts "Message: #{params['Body']}!"

  twiml = Twilio::TwiML::Response.new do |r|
    r.Say "Hello Monkey! You will get an SMS message soon."
    r.Sms "Here it is!"
  end
  twiml.text
end