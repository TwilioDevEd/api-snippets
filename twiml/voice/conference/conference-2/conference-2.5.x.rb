require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
dial = Twilio::TwiML::Dial.new
dial.conference('moderated-conference-room', start_conference_on_enter: false)
response.append(dial)

puts response
