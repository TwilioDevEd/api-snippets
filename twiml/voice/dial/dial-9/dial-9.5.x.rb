require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial(answer_on_bridge: true, refer_url: 'https://example.com/handler') do |dial|
    dial.sip('sip:AgentA@xyz.sip.us1.twilio.com?User-to-User=123456789%3Bencoding%3Dhex&X-Name=Agent%2C+A')
end

puts response
