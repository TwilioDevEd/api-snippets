require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
  dial.sip('sip:jack@example.com;transport=tcp')
end

puts response
