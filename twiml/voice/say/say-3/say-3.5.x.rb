require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say(message: 'Hej!', language: 'sv-SE')

puts response
