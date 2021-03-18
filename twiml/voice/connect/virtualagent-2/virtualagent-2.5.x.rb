require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.say(message: 'Hello! You will be now be connected to a virtual agent.')
response.connect(action: 'https://myactionurl.com/virtualagent_ended') do |connect|
    connect.virtual_agent(connector_name: 'project', status_callback: 'https://mycallbackurl.com')
end

puts response
