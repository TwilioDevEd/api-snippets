require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.play(url: 'https://api.twilio.com/cowbell.mp3', loop: 10)

puts response
