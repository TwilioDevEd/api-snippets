require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.play(loop: 10, url: 'https://api.twilio.com/cowbell.mp3')

puts response
