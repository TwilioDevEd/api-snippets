require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say('You will now be connected to an agent.')

puts response
