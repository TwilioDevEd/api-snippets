require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.refer do |refer|
    refer.sip('sip:alice@example.com')
end

puts response
