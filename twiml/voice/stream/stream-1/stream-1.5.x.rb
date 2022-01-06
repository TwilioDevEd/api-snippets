require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.start do |start|
  start.stream(name: 'Example Audio Stream', url: 'wss://mystream.ngrok.io/audiostream')
end

puts response
