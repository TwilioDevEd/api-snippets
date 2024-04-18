require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.connect do |connect|
    connect.stream(url: 'wss://example.com/audiostream')
end
response.say(message: 'This TwiML instruction is unreachable unless the Stream is ended by your WebSocket server.')

puts response
