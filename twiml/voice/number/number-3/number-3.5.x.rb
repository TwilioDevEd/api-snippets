require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
dial = Twilio::TwiML::Dial.new
dial.number('+14158675309',
  status_callback_event: 'initiated ringing answered completed',
  status_callback: 'https://myapp.com/calls/events',
  status_callback_method: 'POST')
response.append(dial)

puts response
