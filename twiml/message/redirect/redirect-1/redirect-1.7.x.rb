require 'twilio-ruby'

response = Twilio::TwiML::MessagingResponse.new
response.redirect('http://www.example.com/nextInstructions')

puts response
