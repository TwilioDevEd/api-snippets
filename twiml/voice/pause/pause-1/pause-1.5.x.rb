require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
response.say 'I will pause 10 seconds starting now!'
response.pause length: 10
response.say 'I just paused 10 seconds'

puts response
