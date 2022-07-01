require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.connect do |connect|
    connect.conversation(service_instance_sid: 'ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', status_callback: 'https://example.com/yourStatusCallback', status_callback_event: 'call-initiated call-in-progress call-ringing call-completed')
end

puts response
