require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
dial = Twilio::TwiML::Dial.new
dial.sim('DE8caa2afb9d5279926619c458dc7098a8')
response.append(dial)

puts response
