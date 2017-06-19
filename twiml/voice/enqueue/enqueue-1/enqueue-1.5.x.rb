require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.enqueue('support', wait_url: 'wait-music.xml')

puts response
