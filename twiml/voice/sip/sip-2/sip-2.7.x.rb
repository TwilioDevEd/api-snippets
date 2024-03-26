require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
  dial.sip('sip:kate@example.com', username: 'admin', password: '1234')
end

puts response
