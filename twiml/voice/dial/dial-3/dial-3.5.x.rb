require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial(action: '/handleDialCallStatus.php', method: 'GET',
              number: '415-123-4567')
response.say('I am unreachable')

puts response
