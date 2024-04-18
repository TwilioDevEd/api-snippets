require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.start do |start|
    start.stream(name: 'Example Audio Stream', url: 'wss://example.com/audiostream')
end
response.say(message: 'The stream has started.')

puts response
