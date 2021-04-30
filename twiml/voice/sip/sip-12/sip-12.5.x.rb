require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial(sequential: true) do |dial|
    dial.sip('sip:alice@example.com')
    dial.sip('sip:bob@example.com')
    dial.sip('sip:charlie@example.com')
end

puts response
