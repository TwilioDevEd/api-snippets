require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.connect do |connect|
    connect.conversation(service_instance_sid: 'ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', inbound_autocreation: true, routing_assignment_timeout: '10')
end

puts response
