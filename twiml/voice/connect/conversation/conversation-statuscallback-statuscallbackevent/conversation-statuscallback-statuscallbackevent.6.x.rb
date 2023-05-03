require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.connect do |connect|
    connect.conversation(service_instance_sid: 'ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', status_callback: 'https://example.com/yourStatusCallback', status_callback_event: 'call-initiated call-ringing call-answered call-completed')
end

puts response
