require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
dial = Twilio::TwiML::Dial.new
dial.conference('Customer Waiting Room', beep: false,
  end_conference_on_exit: true)
response.append(dial)

puts response
