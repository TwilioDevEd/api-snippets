require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
  dial.conference('moderated-conference-room',
                  start_conference_on_enter: true, end_conference_on_exit: true)
end

puts response
