require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
dial = Twilio::TwiML::Dial.new(caller_id: '+15551112222')
dial.number('+15558675309')
response.append(dial)

puts response
