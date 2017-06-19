require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
dial = Twilio::TwiML::Dial.new
dial.conference('moderated-conference-room', start_conference_on_enter: true,
  end_conference_on_exit: true)
response.append(dial)

puts response
