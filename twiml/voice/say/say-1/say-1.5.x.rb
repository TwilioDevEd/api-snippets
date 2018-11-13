require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say(voice: 'woman', language: 'fr-FR', message: 'Chapeau!')

puts response
