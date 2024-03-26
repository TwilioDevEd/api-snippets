require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.refer do |refer|
    refer.sip('sip:alice@example.com?X-AcctNumber=123456&X-ReasonForCalling=billing-question')
end

puts response
