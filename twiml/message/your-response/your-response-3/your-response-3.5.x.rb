require 'twilio-ruby'

response = Twilio::TwiML::MessagingResponse.new
response.message(message: "I'm hungry!")

puts response
