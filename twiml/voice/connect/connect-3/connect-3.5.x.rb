require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.connect(action: 'https://myactionurl.com/') do |connect|
    connect.room('meeting', statusCallback: 'https://myactionurl.com/')
end

puts response
