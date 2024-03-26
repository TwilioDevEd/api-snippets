require 'twilio-ruby'

response = Twilio::TwiML::MessagingResponse.new
response.message(body: "I'm hungry!")

puts response
