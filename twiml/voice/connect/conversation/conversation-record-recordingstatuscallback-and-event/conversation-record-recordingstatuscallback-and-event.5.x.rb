require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.connect do |connect|
    connect.conversation(service_instance_sid: 'ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', record: 'record-from-answer', recording_status_callback: 'https://example.com/yourRecordingStatusCallback', recording_status_callback_event: 'in-progress completed')
end

puts response
