require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
dial = Twilio::TwiML::Dial.new
dial.sip('sip:kate@example.com?mycustomheader=foo&myotherheader=bar')
response.append(dial)

puts response
