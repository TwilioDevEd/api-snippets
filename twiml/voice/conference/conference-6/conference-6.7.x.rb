require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
  dial.conference('NoMusicNoBeepRoom', beep: false,
                                       wait_url: 'http://your-webhook-host.com',
                                       start_conference_on_enter: true, end_conference_on_exit: true)
end

puts response
