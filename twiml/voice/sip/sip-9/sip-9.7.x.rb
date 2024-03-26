require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial(record: 'record-from-answer', timeout: 10, hangup_on_star: true,
              caller_id: 'bob', method: 'POST', action: '/handle_post_dial') do |dial|
  dial.sip('sip:kate@example.com?x-customheader=foo', method: 'POST',
                                                    url: '/handle_screening_on_answer')
end

puts response
