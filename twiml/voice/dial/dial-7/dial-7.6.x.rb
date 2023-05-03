require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial(record: 'record-from-answer', recording_track: 'inbound', recording_status_callback: 'https://www.myexample.com/recording-handler') do |dial|
    dial.number('+15551239876')
end

puts response
