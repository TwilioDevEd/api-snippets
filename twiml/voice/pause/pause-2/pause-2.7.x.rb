require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.pause(length: 5)
response.say(message: 'Hi there.')

puts response
