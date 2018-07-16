require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say(message: 'Bom dia.', voice: 'alice', language: 'pt-BR', loop: 2)

puts response
