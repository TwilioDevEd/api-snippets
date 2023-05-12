require 'twilio-ruby'

response = Twilio::TwiML::MessagingResponse.new
response.redirect('../nextInstructions')

puts response
