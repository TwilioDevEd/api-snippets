require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.connect do |connect|
    connect.virtual_agent(connector_name: 'project', language: 'fr')
end

puts response
