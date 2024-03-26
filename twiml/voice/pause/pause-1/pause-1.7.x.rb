require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say(message: 'I will pause 10 seconds starting now!')
response.pause(length: 10)
response.say(message: 'I just paused 10 seconds')

puts response
