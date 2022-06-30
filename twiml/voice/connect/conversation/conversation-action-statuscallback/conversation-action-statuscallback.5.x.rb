require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.connect(action: 'https://example.com/yourActionUrl') do |connect|
    connect.conversation(service_instance_sid: 'ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', status_callback: 'https://example.com/yourStatusCallback')
end

puts response
