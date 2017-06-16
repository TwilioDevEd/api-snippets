require 'twilio-ruby'

response = Twilio::TwiML::MessagingResponse.new 
message = Twilio::TwiML::Message.new 
message.body 'Store Location: 123 Easy St.'
message.media 'https://demo.twilio.com/owl.png'
response.append message

puts response
