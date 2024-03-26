require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.redirect('http://pigeons.com/twiml.xml', method: 'POST')

puts response
