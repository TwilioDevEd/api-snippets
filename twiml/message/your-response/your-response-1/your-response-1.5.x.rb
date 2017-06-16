require 'twilio-ruby'

response = Twilio::TwiML::MessagingResponse.new 
message = Twilio::TwiML::Message.new 
message.body 'Hello World!'
response.append message
response.redirect 'https://demo.twilio.com/sms/welcome'

puts response
