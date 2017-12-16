require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require 'sinatra'

post '/sms' do
  body = params['Body'].downcase

  twiml = Twilio::TwiML::Response.new do |r|
    if body == 'hello'
      r.Message 'Hi!'
    elsif body == 'bye'
      r.Message 'Goodbye'
    end
  end

  twiml.text
end
