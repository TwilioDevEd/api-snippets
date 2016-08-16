require 'rubygems' # not necessary with ruby 1.9 but included for completeness 
require 'twilio-ruby'
require 'sinatra'

post '/sms' do
  puts "Message: #{params['Body']}!"

  twiml = Twilio::TwiML::Response.new do |r|
    r.Say "Thanks for calling!"
  end
  twiml.text
end