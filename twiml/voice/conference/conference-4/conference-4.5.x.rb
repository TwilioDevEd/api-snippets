require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
dial = Twilio::TwiML::Dial.new 
dial.conference 'EventedConf', status_callback: 'https://myapp.com/events', status_callback_event: 'start end join leave mute hold'
response.append dial

puts response
