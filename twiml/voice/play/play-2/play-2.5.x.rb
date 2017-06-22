require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.play('https://api.twilio.com/cowbell.mp3')

puts response
