require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say('Hello World')
response.play(url: 'https://api.twilio.com/Cowbell.mp3')

puts response
