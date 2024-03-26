require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial(number: '415-123-4567')
response.say(message: 'Goodbye')

puts response
