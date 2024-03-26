require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial(action: '/handleDialCallStatus', method: 'GET',
              number: '415-123-4567')
response.say(message: 'I am unreachable')

puts response
