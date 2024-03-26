require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
  dial.number('+14155555555',
              status_callback_event: 'initiated ringing answered completed',
              status_callback: 'https://myapp.com/calls/events',
              status_callback_method: 'POST')
  dial.number('+14153333333',
              status_callback_event: 'initiated ringing answered completed',
              status_callback: 'https://example.com/events',
              status_callback_method: 'POST')
end

puts response
