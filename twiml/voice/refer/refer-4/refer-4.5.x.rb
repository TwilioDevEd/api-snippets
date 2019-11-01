require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.refer(action: '/handleRefer', method: 'POST') do |refer|
    refer.sip('sip:alice@example.com')
end

puts response
