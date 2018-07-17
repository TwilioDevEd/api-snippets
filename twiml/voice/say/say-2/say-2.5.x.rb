require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say(message: 'Chapeau!', voice: 'alice', language: 'fr-FR')

puts response
