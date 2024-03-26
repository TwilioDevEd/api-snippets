require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
  dial.conference('Customer Waiting Room', beep: false,
                                           end_conference_on_exit: true)
end

puts response
