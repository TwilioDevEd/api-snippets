require 'twilio-ruby'

response = Twilio::TwiML::MessagingResponse.new
response.message do |message|
  message.body('Store Location: 123 Easy St.')
  message.media('https://demo.twilio.com/owl.png')
end

puts response
