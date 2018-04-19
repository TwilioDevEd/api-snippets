require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require 'sinatra'

# send a dynamic reply to incoming text message
post '/sms' do
  # transform request body to lowercase
  body = params['Body'].downcase

  # Build response based on given body param
  twiml = Twilio::TwiML::MessagingResponse.new do |resp|
    if body == 'hello'
      resp.message body: 'Hi!'
    elsif body == 'bye'
      resp.message body: 'Goodbye'
    end
  end

  twiml.to_s
end
