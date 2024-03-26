require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.connect do |connect|
    connect.virtual_agent(connector_name: 'uniqueName') do |virtual_agent|
        virtual_agent.config(name: 'language', value: 'en-us')
        virtual_agent.config(name: 'voiceName', value: 'en-US-Wavenet-C')
end
end

puts response
