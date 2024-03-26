require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say(voice: 'Polly.Mathieu', language: 'fr-FR', message: "Bonjour! Je m'appelle Mathieu.")

puts response
