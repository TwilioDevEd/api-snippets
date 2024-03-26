require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say(language: 'fr-FR', message: 'Bonjour!')

puts response
