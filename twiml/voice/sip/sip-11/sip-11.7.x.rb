require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
    dial.number('+12143211432')
    dial.sip('sip:alice-soft-phone@example.com')
    dial.sip('sip:alice-desk-phone@example.com')
    dial.sip('sip:alice-mobile-client@example.com')
end

puts response
