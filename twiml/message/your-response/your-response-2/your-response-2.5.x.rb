require 'twilio-ruby'

response = Twilio::TwiML::MessagingResponse.new
response.message(body: 'This is message 1 of 2.')
response.message(body: 'This is message 2 of 2.')

puts response
