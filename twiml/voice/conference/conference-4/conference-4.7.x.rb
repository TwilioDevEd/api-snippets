require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
  dial.conference('EventedConf', status_callback: 'https://myapp.com/events',
                                 status_callback_event: 'start end join leave mute hold')
end

puts response
