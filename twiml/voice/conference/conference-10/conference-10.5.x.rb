require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
  dial.conference('LoveTwilio', record: 'record-from-start',
                                recording_status_callback: 'www.myexample.com')
end

puts response
