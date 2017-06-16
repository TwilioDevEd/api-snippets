require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
dial = Twilio::TwiML::Dial.new
dial.conference('LoveTwilio', record: 'record-from-start', recording_status_callback: 'www.myexample.com')
response.append(dial)

puts response
