require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say('Chapeau!', voice: 'woman', language: 'fr')

puts response
