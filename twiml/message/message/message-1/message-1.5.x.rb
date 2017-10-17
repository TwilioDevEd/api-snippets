require 'twilio-ruby'

response = Twilio::TwiML::MessagingResponse.new
response.message(body: 'Store Location: 123 Easy St.')

puts response
