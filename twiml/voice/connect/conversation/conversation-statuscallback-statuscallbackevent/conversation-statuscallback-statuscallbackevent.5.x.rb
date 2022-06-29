require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.connect do |connect|
    connect.conversation(service_instance_sid: 'ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', status_callback: 'https://your-status-callback-url.com/statusCallback', status_callback_event: 'call-initiated call-in-progress call-ringing call-completed')
end

puts response
