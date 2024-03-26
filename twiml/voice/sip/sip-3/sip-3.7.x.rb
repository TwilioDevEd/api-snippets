require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
  dial.sip('sip:jack@example.com?x-mycustomheader=foo&x-myotherheader=bar')
end

puts response
