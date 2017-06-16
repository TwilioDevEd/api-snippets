require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
response.pause length: 5
response.say 'Hi there.'

puts response
