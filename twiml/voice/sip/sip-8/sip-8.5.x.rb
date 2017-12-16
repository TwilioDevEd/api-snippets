require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
  dial.sip('sip:kate@example.com?mycustomheader=foo&myotherheader=bar')
end

puts response
