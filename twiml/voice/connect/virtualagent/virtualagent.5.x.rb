require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.connect(action: 'https://myactionurl.com/twiml') do |connect|
    connect.virtualagent(connector_name: 'project', statuscallback: 'https://mycallbackurl.com')
end

puts response
