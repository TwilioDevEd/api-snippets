require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.connect do |connect|
    connect.room('meeting', statusCallback: 'https://myactionurl.com/')
end

puts response
