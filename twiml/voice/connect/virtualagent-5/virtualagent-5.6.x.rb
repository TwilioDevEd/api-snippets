require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.connect do |connect|
    connect.virtual_agent(connector_name: 'uniqueName') do |virtual_agent|
        virtual_agent.parameter(name: 'customer_name', value: 'Burton Guster')
end
end

puts response
