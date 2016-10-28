require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require 'sinatra'

# send a dynamic reply to incoming text message
post '/sms' do
  # transform request body to lowercase
  body = params['Body'].downcase

  # Build response based on given body param
  twiml = Twilio::TwiML::Response.new do |resp|
    if body == 'hello'
      resp.Message 'Hi!'
    elsif body == 'bye'
      resp.Message 'Goodbye'
    end
  end

  twiml.text
end
