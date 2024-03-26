require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.start do |start|
    start.siprec(name: 'My SIPREC Stream', connector_name: 'Gridspace_1')
end

puts response
