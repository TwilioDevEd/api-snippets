require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
dial = Twilio::TwiML::Dial.new 
dial.conference 'NoMusicNoBeepRoom', beep: 'false', wait_url: 'http://your-webhook-host.com', start_conference_on_enter: 'true', end_conference_on_exit: 'true'
response.append dial

puts response
