require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
dial = Twilio::TwiML::Dial.new record: 'record-from-answer', timeout: 10, hangup_on_star: true, caller_id: 'bob', method: 'POST', action: '/handle_post_dial'
dial.sip 'sip:kate@example.com?customheader=foo', method: 'POST', url: '/handle_screening_on_answer'
response.append dial

puts response
