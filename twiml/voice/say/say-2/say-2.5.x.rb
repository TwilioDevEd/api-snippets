require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
response.say 'Chapeau!', voice: 'alice', language: 'fr-FR'

puts response
