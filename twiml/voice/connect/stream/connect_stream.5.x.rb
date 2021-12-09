require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.connect do |connect|
  connect.stream(url: 'wss://mystream.ngrok.io/audiostream')
end

puts response
