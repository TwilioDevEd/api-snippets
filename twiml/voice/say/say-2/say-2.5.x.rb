require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say(voice: 'alice', language: 'fr-FR', message: 'Chapeau!')

puts response
