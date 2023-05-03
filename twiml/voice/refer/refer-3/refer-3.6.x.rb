require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.refer do |refer|
    refer.sip('sip:alice@example.com?User-to-User=123456789%3Bencoding%3Dhex')
end

puts response
