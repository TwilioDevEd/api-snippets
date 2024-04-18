require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
    dial.client do |client|
        client.identity('user_jane')
        client.parameter(name: 'FirstName', value: 'Jane')
        client.parameter(name: 'LastName', value: 'Doe')
end
end

puts response
