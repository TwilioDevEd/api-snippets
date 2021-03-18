require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.connect(action: 'https://myactionurl.com/twiml') do |connect|
    connect.virtual_agent(connector_name: 'project', status_callback: 'https://mycallbackurl.com')
end

puts response
