require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial(number: '415-123-4567')
response.say('Goodbye')

puts response
