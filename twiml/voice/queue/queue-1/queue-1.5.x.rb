require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
dial = Twilio::TwiML::Dial.new
dial.queue('support', url: 'about_to_connect.xml')
response.append(dial)

puts response
