require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
    dial.application do |application|
        application.application_sid('AP1234567890abcdef1234567890abcd')
        application.parameter(name: 'AccountNumber', value: '12345')
        application.parameter(name: 'TicketNumber', value: '9876')
end
end

puts response
