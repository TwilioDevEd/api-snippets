require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.start do |start|
    start.stream(url: 'wss://mystream.ngrok.io/example') do |stream|
        stream.parameter(name: 'FirstName', value: 'Jane')
        stream.parameter(name: 'LastName', value: 'Doe')
end
end

puts response
