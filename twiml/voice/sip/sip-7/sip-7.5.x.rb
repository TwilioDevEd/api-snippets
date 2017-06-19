require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
dial = Twilio::TwiML::Dial.new
dial.sip('kate@example.com', username: 'admin', password: '1234')
response.append(dial)

puts response
