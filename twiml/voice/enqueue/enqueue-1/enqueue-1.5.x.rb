require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.enqueue(name: 'support', wait_url: 'wait-music.xml')

puts response
