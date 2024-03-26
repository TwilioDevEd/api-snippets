require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say(loop: 2, message: 'Hello!')

puts response
